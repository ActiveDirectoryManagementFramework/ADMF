function Set-AdmfContext
{
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
	
	.PARAMETER Server
		The server / domain to work with.
		
	.PARAMETER Credential
		The credentials to use for this operation.
	
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
	[CmdletBinding(DefaultParameterSetName = 'name')]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'name')]
		[Alias('Name')]
		[object[]]
		$Context,
		
		[Parameter(ParameterSetName = 'interactive')]
		[switch]
		$Interactive,
		
		[string]
		$Server = $env:USERDNSDOMAIN,
		
		[System.Management.Automation.PSCredential]
		$Credential,
		
		[switch]
		$EnableException
	)
	
	begin
	{
		#region Utility Functions
		function Set-Context
		{
			[CmdletBinding()]
			param (
				$ContextObject,
				
				[string]
				$Server,
				
				[System.Management.Automation.PSCredential]
				$Credential,
				
				[System.Management.Automation.PSScriptCmdlet]
				$Cmdlet,
				
				[bool]
				$EnableException
			)
			
			Write-PSFMessage -String 'Set-AdmfContext.Context.Applying' -StringValues $ContextObject.Name -Target $ContextObject
			$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
			$stopParam = @{
				EnableException = $EnableException
				Cmdlet		    = $Cmdlet
				Target		    = $ContextObject
				StepsUpward	    = 1
			}
			
			#region PreImport
			if (Test-Path "$($ContextObject.Path)\preImport.ps1")
			{
				try { & "$($ContextObject.Path)\preImport.ps1" @parameters }
				catch
				{
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.PreImport' -StringValues $ContextObject.Name -ErrorRecord $_
					return
				}
			}
			#endregion PreImport
			
			#region Forest
			$forestFields = @{
				'schema' = (Get-Command Register-FMSchema)
				'sitelinks' = (Get-Command Register-FMSiteLink)
				'sites'  = (Get-Command Register-FMSite)
				'subnets' = (Get-Command Register-FMSubnet)
			}
			
			foreach ($key in $forestFields.Keys)
			{
				if (-not (Test-Path "$($ContextObject.Path)\forest\$key")) { continue }
				
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\forest\$key\" -Recurse -Filter "*.json"))
				{
					Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, $key, $file.FullName
					try
					{
						foreach ($dataSet in (Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop | Write-Output | ConvertTo-PSFHashtable -Include $forestFields[$key].Parameters.Keys))
						{
							& $forestFields[$key] @dataSet -ErrorAction Stop
						}
					}
					catch
					{
						Clear-DMConfiguration
						Clear-FMConfiguration
						Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, $key, $file.FullName -ErrorRecord $_
						return
					}
				}
			}
			
			if (Test-Path "$($ContextObject.Path)\forest\schemaldif")
			{
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\forest\schemaldif\" -Recurse -Filter "*.ldif"))
				{
					try { Register-FMSchemaLdif -Name $file.BaseName -Path $file.FullName -ErrorAction Stop }
					catch
					{
						Clear-DMConfiguration
						Clear-FMConfiguration
						Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.ForestConfig' -StringValues $ContextObject.Name, 'schemaldif', $file.FullName -ErrorRecord $_
						return
					}
				}
			}
			#endregion Forest
			
			#region Domain
			$domainFields = @{
				'accessrules' = (Get-Command Register-DMAccessRule)
				'acl'		  = (Get-Command Register-DMAcl)
				'builtinsids' = (Get-Command Register-DMBuiltInSID)
				'gplinks'	  = (Get-Command Register-DMGPLink)
				'groups'	  = (Get-Command Register-DMGroup)
				'groupmemberships' = (Get-Command Register-DMGroupMembership)
				'grouppolicies' = (Get-Command Register-DMGroupPolicy)
				'names'	      = (Get-Command Register-DMNameMapping)
				'objectcategories' = (Get-Command Register-DMObjectCategory)
				'objects'	  = (Get-Command Register-DMObject)
				'organizationalunits' = (Get-Command Register-DMOrganizationalUnit)
				'psos'	      = (Get-Command Register-DMPasswordPolicy)
				'users'	      = (Get-Command Register-DMUser)
			}
			
			foreach ($key in $domainFields.Keys)
			{
				if (-not (Test-Path "$($ContextObject.Path)\domain\$key")) { continue }
				
				foreach ($file in (Get-ChildItem "$($ContextObject.Path)\domain\$key\" -Recurse -Filter "*.json"))
				{
					Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, $key, $file.FullName
					try
					{
						foreach ($dataSet in (Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop | Write-Output | ConvertTo-PSFHashtable -Include $domainFields[$key].Parameters.Keys))
						{
							& $domainFields[$key] @dataSet -ErrorAction Stop
						}
					}
					catch
					{
						Clear-DMConfiguration
						Clear-FMConfiguration
						Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DomainConfig' -StringValues $ContextObject.Name, $key, $file.FullName -ErrorRecord $_
						return
					}
				}
			}
			
			# Content Mode
			if (Test-Path "$($ContextObject.Path)\domain\content_mode.json")
			{
				$file = Get-Item "$($ContextObject.Path)\domain\content_mode.json"
				Write-PSFMessage -Level Debug -String 'Set-AdmfContext.Context.Loading' -StringValues $ContextObject.Name, 'ContentMode', $file.FullName
				try
				{
					$dataSet = Get-Content $file.FullName | ConvertFrom-Json -ErrorAction Stop
					if ($dataSet.Mode) { Set-DMContentMode -Mode $dataSet.Mode }
					if ($dataSet.Include)
					{
						$includes = @((Get-DMContentMode).Include)
						foreach ($entry in $dataSet.Include) { $includes += $entry }
						Set-DMContentMode -Include $includes
					}
					if ($dataSet.Exclude)
					{
						$excludes = @((Get-DMContentMode).Exclude)
						foreach ($entry in $dataSet.Exclude) { $excludes += $entry }
						Set-DMContentMode -Exclude $excludes
					}
					if ($dataSet.UserExcludePattern)
					{
						$userExcludePatterns = @((Get-DMContentMode).UserExcludePattern)
						foreach ($entry in $dataSet.UserExcludePattern) { $userExcludePatterns += $entry }
						Set-DMContentMode -UserExcludePattern $userExcludePatterns
					}
				}
				catch
				{
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DomainConfig' -StringValues $ContextObject.Name, $key, $file.FullName -ErrorRecord $_
					return
				}
			}
			#endregion Domain
			
			#region DC
			if (Test-Path "$($ContextObject.Path)\dc\dc_config.json")
			{
				try { $dcData = Get-Content "$($ContextObject.Path)\dc\dc_config.json" -ErrorAction Stop | ConvertFrom-Json -ErrorAction Stop }
				catch
				{
					Clear-DMConfiguration
					Clear-FMConfiguration
					Stop-PSFFunction @stopParam -String 'Set-AdmfContext.Context.Error.DCConfig' -StringValues $ContextObject.Name -ErrorRecord $_
					return
				}
				
				if ($null -ne $dcData.NoDNS) { Set-PSFConfig -FullName 'DCManagement.Defaults.NoDNS' -Value $dcData.NoDNS }
				if ($null -ne $dcData.NoReboot) { Set-PSFConfig -FullName 'DCManagement.Defaults.NoReboot' -Value $dcData.NoReboot }
				if ($dcData.DatabasePath) { Set-PSFConfig -FullName 'DCManagement.Defaults.DatabasePath' -Value $dcData.DatabasePath }
				if ($dcData.LogPath) { Set-PSFConfig -FullName 'DCManagement.Defaults.LogPath' -Value $dcData.LogPath }
				if ($dcData.SysvolPath) { Set-PSFConfig -FullName 'DCManagement.Defaults.NoDNS' -Value $dcData.SysvolPath }
			}
			#endregion DC
			
			#region PostImport
			if (Test-Path "$($ContextObject.Path)\postImport.ps1")
			{
				try { & "$($ContextObject.Path)\postImport.ps1" @parameters }
				catch
				{
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
			Continue	    = $true
		}
	}
	process
	{
		#region Explicitly specified contexts
		foreach ($contextObject in $Context)
		{
			if ($contextObject -is [string])
			{
				$foundContext = Get-AdmfContext -Name $contextObject
				if (-not $foundContext) { Stop-PSFFunction @commonParam -String 'Set-AdmfContext.Context.NotFound' -StringValues $contextObject }
				if ($foundContext.Count -gt 1) { Stop-PSFFunction @commonParam -String 'Set-AdmfContext.Context.Ambiguous' -StringValues $contextObject, ($foundContext.Name -join ", ") }
				$selectedContexts[$foundContext.Name] = $foundContext
				continue
			}
			if ($contextObject.PSObject.Typenames -eq 'ADMF.Context')
			{
				$selectedContexts[$contextObject.Name] = $contextObject
				continue
			}
			Stop-PSFFunction @commonParam -String 'Set-AdmfContext.Context.InvalidInput' -StringValues $contextObject, $contextObject.GetType().FullName
		}
		#endregion Explicitly specified contexts
		#region Interactively chosen contexts
		if ($Interactive)
		{
			foreach ($contextObjects in (Invoke-CallbackMenu -Server $Server))
			{
				$selectedContexts[$contextObject.Name] = $contextObject
			}
		}
		#endregion Interactively chosen contexts
	}
	end
	{
		#region Handle errors in selection
		$missingPrerequisites = $selectedContexts.Values.Prerequisites | Where-Object { $_ -notin $selectedContexts.Values.Name }
		if ($missingPrerequisites)
		{
			Stop-PSFFunction -String 'Set-AdmfContext.Resolution.MissingPrerequisites' -StringValues ($missingPrerequisites -join ", ") -EnableException $EnableException -Category InvalidData
			return
		}
		$conflictingContexts = $selectedContexts.Values.MutuallyExclusive | Where-Object { $_ -in $selectedContexts.Values.Name }
		if ($conflictingContexts)
		{
			Stop-PSFFunction -String 'Set-AdmfContext.Resolution.ExclusionConflict' -StringValues ($selectedContexts.Values.Name -join ", ") -EnableException $EnableException -Category InvalidData
			return
		}
		#endregion Handle errors in selection
		
		# Kill previous configuration
		Clear-DMConfiguration
		Clear-FMConfiguration
		
		foreach ($contextObject in ($selectedContexts.Values | Sort-Object Weight))
		{
			if (Test-PSFFunctionInterrupt) { return }
			Set-Context @parameters -ContextObject $contextObject
		}
		$script:assignedContexts[$Server] = $selectedContexts.Values | Sort-Object Weight
		$script:loadedContexts = @($selectedContexts.Values | Sort-Object Weight)
	}
}