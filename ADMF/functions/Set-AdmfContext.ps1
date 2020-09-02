function Set-AdmfContext {
	<#
	.SYNOPSIS
		Applies a set of configuration contexts.
	
	.DESCRIPTION
		Applies a set of configuration contexts.
		This merges the settings from all selected contexts into one configuration set.
	
	.PARAMETER Context
		Name of context or full context object to apply.
	
	.PARAMETER Interactive
		Show an interactive context selection prompt.
		This is designed for greater convenience when managing many forests.
		The system automatically uses Set-AdmfContext with this parameter when directly testing or invoking against a new domain without first selecting a context to apply.
	
	.PARAMETER ReUse
		ADMF remembers the last contexts assigned to a specific server/domain.
		By setting this parameter, it will re-use those contexts, rather than show the prompt again.
		This parameter is used by the system to prevent prompting automatically on each call.
	
	.PARAMETER Server
		The server / domain to work with.
	
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.PARAMETER NoDomain
		If used against a target without a domain, it will skip AD connect and instead use the server name for Context caching purposes.
	
	.PARAMETER EnableException
		This parameters disables user-friendly warnings and enables the throwing of exceptions.
		This is less user friendly, but allows catching exceptions in calling scripts.
	
	.EXAMPLE
		PS C:\> Set-AdmfContext -Interactive
		
		Interactively pick to select the contexts to apply to the user's own domain.
	
	.EXAMPLE
		PS C:\> Set-AdmfContext -Interactive -Server contoso.com
		
		Interactively pick to select the contexts to apply to the contoso.com domain.
	
	.EXAMPLE
		PS C:\> Set-AdmfContext -Context Default, Production, Europe -Server eu.contoso.com
		
		Configures the contexts Default, Production and Europe to be applied to eu.contoso.com.
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
	[CmdletBinding(DefaultParameterSetName = 'name')]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'name')]
		[Alias('Name')]
		[object[]]
		$Context,
		
		[Parameter(ParameterSetName = 'interactive')]
		[switch]
		$Interactive,
		
		[switch]
		$ReUse,
		
		[PSFComputer]
		$Server = $env:USERDNSDOMAIN,
		
		[System.Management.Automation.PSCredential]
		$Credential,
		
		[Parameter(DontShow = $true)]
		[switch]
		$NoDomain,
		
		[switch]
		$EnableException
	)
	
	begin {
		#region Utility Functions
		function Set-Context {
			[CmdletBinding()]
			param (
				$ContextObject,
				
				[string]
				$Server,
				
				[System.Management.Automation.PSCredential]
				$Credential,
				
				[System.Management.Automation.PSCmdlet]
				$Cmdlet,
				
				[bool]
				$EnableException
			)
			
			Write-PSFMessage -String 'Set-AdmfContext.Context.Applying' -StringValues $ContextObject.Name -Target $ContextObject
			$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
			$stopParam = @{
				EnableException = $EnableException
				Cmdlet          = $Cmdlet
				Target          = $ContextObject
				StepsUpward     = 1
			}
			
			#region PreImport
			if (Test-Path "$($ContextObject.Path)\preImport.ps1") {
				try { $null = & "$($ContextObject.Path)\preImport.ps1" @parameters }
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.PreImport' -StringValues $ContextObject.Name -ErrorRecord $_
					return
				}
			}
			#endregion PreImport
			
			#region Forest
			$forestFields = @{
				'schema'    = Get-Command Register-FMSchema
				'sitelinks' = Get-Command Register-FMSiteLink
				'sites'     = Get-Command Register-FMSite
				'subnets'   = Get-Command Register-FMSubnet
			}
			
			foreach ($key in $forestFields.Keys) {
				if (-not (Test-Path "$($ContextObject.Path)\forest\$key")) { continue }
				
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\forest\$key\" -Recurse -Filter "*.json")) {
					Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, $key, $file.FullName
					try {
						foreach ($dataSet in (Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop | Write-Output | ConvertTo-PSFHashtable -Include $($forestFields[$key].Parameters.Keys))) {
							if ($forestFields[$key].Parameters.Keys -contains 'ContextName') {
								$dataSet['ContextName'] = $ContextObject.Name
							}
							& $forestFields[$key] @dataSet -ErrorAction Stop
						}
					}
					catch
					{
						Clear-DCConfiguration
						Clear-DMConfiguration
						Clear-FMConfiguration
						Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, $key, $file.FullName -ErrorRecord $_
						return
					}
				}
			}
			
			if (Test-Path "$($ContextObject.Path)\forest\schemaldif") {
				$filesProcessed = @()

				#region Process Ldif Configuration
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\forest\schemaldif\" -Recurse -Filter "*.json")) {
					$jsonData = Get-Content $file.FullName | ConvertFrom-Json
					foreach ($jsonEntry in $jsonData) {
						$targetPath = Join-Path "$($ContextObject.Path)\forest\schemaldif" $jsonEntry.Path
						if ($filesProcessed -contains $targetPath) { continue }

						try { $ldifItem = Get-Item -Path $targetPath -ErrorAction Stop -Force }
						catch
						{
							Clear-DCConfiguration
							Clear-DMConfiguration
							Clear-FMConfiguration
							Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, 'Schema (ldif)', $file.FullName -ErrorRecord $_
							return
						}

						$ldifParam = @{
							Path        = $ldifItem.FullName
							Name        = $ldifItem.BaseName
							ContextName = $ContextObject.Name
						}
						if ($jsonEntry.Name) { $ldifParam.Name = $jsonEntry.Name }
						if ($jsonEntry.Weight) { $ldifParam['Weight'] = $jsonEntry.Weight }
						if ($jsonEntry.MissingObjectExemption) { $ldifParam['MissingObjectExemption'] = $jsonEntry.MissingObjectExemption }
						try {
							Register-FMSchemaLdif @ldifParam -ErrorAction Stop
							$filesProcessed += $ldifItem.FullName
						}
						catch
						{
							Clear-DCConfiguration
							Clear-DMConfiguration
							Clear-FMConfiguration
							Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, 'schemaldif', $file.FullName -ErrorRecord $_
							return
						}
					}
				}
				#endregion Process Ldif Configuration

				#region Process Ldif Files without configuration
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\forest\schemaldif\" -Recurse -Filter "*.ldf")) {
					# Skip files already defined in json
					if ($filesProcessed -contains $file.FullName) { continue }
					
					try { Register-FMSchemaLdif -Name $file.BaseName -Path $file.FullName -ContextName $ContextObject.Name -ErrorAction Stop }
					catch
					{
						Clear-DCConfiguration
						Clear-DMConfiguration
						Clear-FMConfiguration
						Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, 'schemaldif', $file.FullName -ErrorRecord $_
						return
					}
				}
				#endregion Process Ldif Files without configuration
			}
			
			# Forest Level
			if (Test-Path "$($ContextObject.Path)\forest\forest_level.json")
			{
				$file = Get-Item "$($ContextObject.Path)\forest\forest_level.json"
				Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, 'ForestLevel', $file.FullName
				try
				{
					$dataSet = Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop
					Register-FMForestLevel -Level $dataSet.Level -ContextName $ContextObject.Name
				}
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, 'ForestLevel', $file.FullName -ErrorRecord $_
					return
				}
			}
			
			#region NTAuthStore
			if (Test-Path "$($ContextObject.Path)\forest\ntAuthStore")
			{
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\forest\ntAuthStore" -Recurse -File))
				{
					switch ($file.Extension)
					{
						'.json'
						{
							Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, 'NTAuthStore', $file.FullName
							try
							{
								$jsonData = Get-Content -Path $file.FullName | ConvertFrom-Json -ErrorAction Stop
								if ($jsonData.PSObject.Properties.Name -eq 'Authorative')
								{
									Register-FMNTAuthStore -Authorative:$jsonData.Authorative
								}
							}
							catch
							{
								Clear-DCConfiguration
								Clear-DMConfiguration
								Clear-FMConfiguration
								Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, 'NTAuthStore', $file.FullName -ErrorRecord $_
								return
							}
						}
						'.cer'
						{
							Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, 'NTAuthStore', $file.FullName
							try
							{
								$cert = [System.Security.Cryptography.X509Certificates.X509Certificate2]::CreateFromCertFile($file.FullName)
								Register-FMNTAuthStore -Certificate $cert
							}
							catch
							{
								Clear-DCConfiguration
								Clear-DMConfiguration
								Clear-FMConfiguration
								Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, 'NTAuthStore', $file.FullName -ErrorRecord $_
								return
							}
						}
					}
				}
			}
			#endregion NTAuthStore
			#endregion Forest
			
			#region Domain
			$domainFields = @{
				'accessrules'         = (Get-Command Register-DMAccessRule)
				'accessrulemodes'     = (Get-Command Register-DMAccessRuleMode)
				'acls'                = (Get-Command Register-DMAcl)
				'builtinsids'         = (Get-Command Register-DMBuiltInSID)
				'gplinks'             = (Get-Command Register-DMGPLink)
				'gppermissions'       = (Get-Command Register-DMGPPermission)
				'gppermissionfilters' = (Get-Command Register-DMGPPermissionFilter)
				'gpregistrysettings'  = (Get-Command Register-DMGPRegistrySetting)
				'groups'              = (Get-Command Register-DMGroup)
				'groupmemberships'    = (Get-Command Register-DMGroupMembership)
				'names'               = (Get-Command Register-DMNameMapping)
				'objects'             = (Get-Command Register-DMObject)
				'organizationalunits' = (Get-Command Register-DMOrganizationalUnit)
				'psos'                = (Get-Command Register-DMPasswordPolicy)
				'users'               = (Get-Command Register-DMUser)
			}
			
			foreach ($key in $domainFields.Keys) {
				if (-not (Test-Path "$($ContextObject.Path)\domain\$key")) { continue }
				
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\domain\$key\" -Recurse -Filter "*.json")) {
					Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, $key, $file.FullName
					try {
						foreach ($dataSet in (Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop | Write-Output | ConvertTo-PSFHashtable -Include $($domainFields[$key].Parameters.Keys))) {
							if ($domainFields[$key].Parameters.Keys -contains 'ContextName') {
								$dataSet['ContextName'] = $ContextObject.Name
							}
							& $domainFields[$key] @dataSet -ErrorAction Stop
						}
					}
					catch
					{
						Clear-DCConfiguration
						Clear-DMConfiguration
						Clear-FMConfiguration
						Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DomainConfig' -StringValues $ContextObject.Name, $key, $file.FullName -ErrorRecord $_
						return
					}
				}
			}

			# Group Policy
			if (Test-Path "$($ContextObject.Path)\domain\grouppolicies\exportData.json") {
				$file = Get-Item "$($ContextObject.Path)\domain\grouppolicies\exportData.json"
				Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, 'Group Policy', $file.FullName
				try {
					$dataSet = Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop | ConvertTo-PSFHashtable -Include DisplayName, Description, ID, ExportID
					foreach ($policyEntry in $dataSet) {
						Register-DMGroupPolicy @policyEntry -Path "$($ContextObject.Path)\domain\grouppolicies\$($policyEntry.ID)"
					}
				}
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DomainConfig' -StringValues $ContextObject.Name, 'Group Policy', $file.FullName -ErrorRecord $_
					return
				}
			}

			# Object Categories
			foreach ($file in (Get-ChildItem "$($ContextObject.Path)\domain\objectcategories" -Filter '*.psd1' -ErrorAction Ignore)) {
				try {
					$dataSet = Import-PSFPowerShellDataFile -Path $file.FullName
					$dataSet.TestScript = $dataSet.TestScript.Invoke() | Write-Output # Remove automatic scriptblock nesting
					Register-DMObjectCategory @dataSet
				}
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DomainConfig' -StringValues $ContextObject.Name, 'Object Categories', $file.FullName -ErrorRecord $_
					return
				}
			}

			# Domain Data
			foreach ($file in (Get-ChildItem "$($ContextObject.Path)\domain\domaindata" -Filter '*.psd1' -ErrorAction Ignore)) {
				try {
					$dataSet = Import-PSFPowerShellDataFile -Path $file.FullName
					$dataSet.Scriptblock = $dataSet.Scriptblock.Invoke() | Write-Output # Remove automatic scriptblock nesting
					Register-DMDomainData @dataSet
				}
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DomainConfig' -StringValues $ContextObject.Name, 'Domain Data', $file.FullName -ErrorRecord $_
					return
				}
			}
			
			# Domain Level
			if (Test-Path "$($ContextObject.Path)\domain\domain_level.json")
			{
				$file = Get-Item "$($ContextObject.Path)\domain\domain_level.json"
				Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, 'DomainLevel', $file.FullName
				try
				{
					$dataSet = Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop
					Register-DMDomainLevel -Level $dataSet.Level -ContextName $ContextObject.Name
				}
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DomainConfig' -StringValues $ContextObject.Name, 'DomainLevel', $file.FullName -ErrorRecord $_
					return
				}
			}
			
			# Content Mode
			if (Test-Path "$($ContextObject.Path)\domain\content_mode.json") {
				$file = Get-Item "$($ContextObject.Path)\domain\content_mode.json"
				Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, 'ContentMode', $file.FullName
				try {
					$dataSet = Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop
					if ($dataSet.Mode) { Set-DMContentMode -Mode $dataSet.Mode }
					if ($dataSet.Include) {
						$includes = @((Get-DMContentMode).Include)
						foreach ($entry in $dataSet.Include) { $includes += $entry }
						Set-DMContentMode -Include $includes
					}
					if ($dataSet.Exclude) {
						$excludes = @((Get-DMContentMode).Exclude)
						foreach ($entry in $dataSet.Exclude) { $excludes += $entry }
						Set-DMContentMode -Exclude $excludes
					}
					if ($dataSet.UserExcludePattern) {
						$userExcludePatterns = @((Get-DMContentMode).UserExcludePattern)
						foreach ($entry in $dataSet.UserExcludePattern) { $userExcludePatterns += $entry }
						Set-DMContentMode -UserExcludePattern $userExcludePatterns
					}
				}
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DomainConfig' -StringValues $ContextObject.Name, 'ContentMode', $file.FullName -ErrorRecord $_
					return
				}
			}
			#endregion Domain
			
			#region DC
			if (Test-Path "$($ContextObject.Path)\dc\dc_config.json") {
				try { $dcData = Get-Content "$($ContextObject.Path)\dc\dc_config.json" -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop }
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DCConfig' -StringValues $ContextObject.Name -ErrorRecord $_
					return
				}
				
				if ($null -ne $dcData.NoDNS) { Set-PSFConfig -FullName 'DCManagement.Defaults.NoDNS' -Value $dcData.NoDNS }
				if ($null -ne $dcData.NoReboot) { Set-PSFConfig -FullName 'DCManagement.Defaults.NoReboot' -Value $dcData.NoReboot }
				if ($dcData.DatabasePath) { Set-PSFConfig -FullName 'DCManagement.Defaults.DatabasePath' -Value $dcData.DatabasePath }
				if ($dcData.LogPath) { Set-PSFConfig -FullName 'DCManagement.Defaults.LogPath' -Value $dcData.LogPath }
				if ($dcData.SysvolPath) { Set-PSFConfig -FullName 'DCManagement.Defaults.SysvolPath' -Value $dcData.SysvolPath }
			}
			
			$dcFields = @{
				'shares' = Get-Command Register-DCShare
				'fsaccessrules' = Get-Command Register-DCAccessRule
			}
			
			foreach ($key in $dcFields.Keys)
			{
				if (-not (Test-Path "$($ContextObject.Path)\dc\$key")) { continue }
				
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\dc\$key\" -Recurse -Filter "*.json"))
				{
					Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, $key, $file.FullName
					try
					{
						foreach ($dataSet in (Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop | Write-Output | ConvertTo-PSFHashtable -Include $($dcFields[$key].Parameters.Keys)))
						{
							if ($dcFields[$key].Parameters.Keys -contains 'ContextName')
							{
								$dataSet['ContextName'] = $ContextObject.Name
							}
							& $dcFields[$key] @dataSet -ErrorAction Stop
						}
					}
					catch
					{
						Clear-DCConfiguration
						Clear-DMConfiguration
						Clear-FMConfiguration
						Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, $key, $file.FullName -ErrorRecord $_
						return
					}
				}
			}
			#endregion DC
			
			#region PostImport
			if (Test-Path "$($ContextObject.Path)\postImport.ps1") {
				try { $null = & "$($ContextObject.Path)\postImport.ps1" @parameters }
				catch
				{
					Clear-DCConfiguration
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.PostImport' -StringValues $ContextObject.Name -ErrorRecord $_
					return
				}
			}
			#endregion PostImport
		}
		#endregion Utility Functions
		
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		
		$selectedContexts = @{ }
		# Common parameters for Stop-PSFFunction
		$commonParam = @{
			EnableException = $EnableException
			Continue        = $true
		}
		
		if ($NoDomain)
		{
			$domain = [pscustomobject]@{ DNSRoot = $Server }
			return # Ends the current block and moves on to process
		}
		$adParameters = $parameters.Clone()
		if (-not $adParameters.Credential) { $adParameters.Remove('Credential') }
		try { $domain = Get-ADDomain @adParameters -ErrorAction Stop }
		catch
		{
			Stop-PSFFunction -String 'Set-AdmfContext.Domain.AccessError' -StringValues $Server -EnableException $EnableException -ErrorRecord $_
			return
		}
	}
	process
	{
		if (Test-PSFFunctionInterrupt) { return }
		
		#region Explicitly specified contexts
		foreach ($contextObject in $Context) {
			if ($contextObject -is [string]) {
				$foundContext = Get-AdmfContext -Name $contextObject
				if (-not $foundContext) { Stop-PSFFunction @commonParam -String 'Set-AdmfContext.Context.NotFound' -StringValues $contextObject }
				if ($foundContext.Count -gt 1) { Stop-PSFFunction @commonParam -String 'Set-AdmfContext.Context.Ambiguous' -StringValues $contextObject, ($foundContext.Name -join ", ") }
				$selectedContexts[$foundContext.Name] = $foundContext
				continue
			}
			if ($contextObject.PSObject.Typenames -eq 'ADMF.Context') {
				$selectedContexts[$contextObject.Name] = $contextObject
				continue
			}
			Stop-PSFFunction @commonParam -String 'Set-AdmfContext.Context.InvalidInput' -StringValues $contextObject, $contextObject.GetType().FullName
		}
		#endregion Explicitly specified contexts
		#region Interactively chosen contexts
		if ($Interactive) {
			if ($ReUse -and $script:assignedContexts["$($domain.DNSRoot)"]) {
				foreach ($contextObject in $script:assignedContexts["$($domain.DNSRoot)"]) {
					$selectedContexts[$contextObject.Name] = $contextObject
				}
				return
			}
			try {
				foreach ($contextObject in (Invoke-CallbackMenu @parameters)) {
					$selectedContexts[$contextObject.Name] = $contextObject
				}
			}
			catch {
				Stop-PSFFunction -String 'Set-AdmfContext.Interactive.Cancel' -EnableException $EnableException -ErrorRecord $_
				return
			}
		}
		#endregion Interactively chosen contexts
	}
	end {
		if (Test-PSFFunctionInterrupt) { return }
		
		#region Handle errors in selection
		$missingPrerequisites = $selectedContexts.Values.Prerequisites | Where-Object { $_ -notin $selectedContexts.Values.Name }
		if ($missingPrerequisites) {
			Stop-PSFFunction -String 'Set-AdmfContext.Resolution.MissingPrerequisites' -StringValues ($missingPrerequisites -join ", ") -EnableException $EnableException -Category InvalidData
			return
		}
		$conflictingContexts = $selectedContexts.Values.MutuallyExclusive | Where-Object { $_ -in $selectedContexts.Values.Name }
		if ($conflictingContexts) {
			Stop-PSFFunction -String 'Set-AdmfContext.Resolution.ExclusionConflict' -StringValues ($conflictingContexts.Name -join ", ") -EnableException $EnableException -Category InvalidData
			return
		}
		#endregion Handle errors in selection
		
		# Do nothing if the currently loaded contexts are equal to the selected ones
		if (
			$script:loadedContexts.Name -and
			$selectedContexts.Values.Name -and
			-not (Compare-Object -ReferenceObject $selectedContexts.Values.Name -DifferenceObject $script:loadedContexts.Name)
		) {
			# When switching from one domain to a new one, make sure that the selection is cached, even if it is the same selection.
			# Otherwise, the second domain will keep reprompting for contexts
			if (-not $script:assignedContexts["$($domain.DNSRoot)"]) { $script:assignedContexts["$($domain.DNSRoot)"] = $selectedContexts.Values }
			return
		}
		
		# Kill previous configuration
		$script:loadedContexts = @()
		Clear-DCConfiguration
		Clear-DMConfiguration
		Clear-FMConfiguration
		
		Set-PSFTaskEngineCache -Module ADMF -Name currentlyImportingContexts -Value $selectedContexts.Values
		
		foreach ($contextObject in ($selectedContexts.Values | Sort-Object Weight)) {
			if (Test-PSFFunctionInterrupt) { return }
			Set-Context @parameters -ContextObject $contextObject -Cmdlet $PSCmdlet -EnableException $EnableException
			if (Test-PSFFunctionInterrupt) { return }
		}
		$script:assignedContexts["$($domain.DNSRoot)"] = $selectedContexts.Values | Sort-Object Weight
		$script:loadedContexts = @($selectedContexts.Values | Sort-Object Weight)
		Set-PSFTaskEngineCache -Module ADMF -Name currentlyImportingContexts -Value @()
	}
}