function New-AdmfContext
{
<#
	.SYNOPSIS
		Creates a new configuration context for ADMF.
	
	.DESCRIPTION
		Creates a new configuration context for ADMF.
		Contexts are a set of configuration settings.
		You can combine multiple contexts at the same time, merging the settings they contain.
		
		For more details on how contexts work, see:
		
			Get-Help about_ADMF_Context
	
	.PARAMETER Name
		The name of the context to create.
	
	.PARAMETER Store
		The context store to create the context in.
		Context Stores are registered filesystem locations where ADMF will look for contexts.
		Defaults to the default store found in %AppData%.
	
	.PARAMETER OutPath
		Create the context in a target path, rather than a registered store.
		Keep in mind, that this will require the context to be manually moved to a registered location in order for it to become available to use.
	
	.PARAMETER Weight
		The priority of the context.
		This is used to determine the import order when importing multiple contexts.
		The higher the value, the later in the import order.
		Default: 50
	
	.PARAMETER Description
		Add a description to your context (for documentation purposes only).
	
	.PARAMETER Author
		The author of the context (for documentation purposes only)
	
	.PARAMETER Group
		The group to assign the context to.
		By default, will be part of the "Default" group.
		Groups are only relevant fpr the itneractive context selection menu, where they govern the visual display style / grouping.
	
	.PARAMETER Prerequisite
		Contexts the current context depends on / requires.
	
	.PARAMETER MutuallyExclusive
		Contexts that are mutually exclusive with each other.
		E.g.: Where the user has to select between one of several environments.
	
	.PARAMETER DefaultAccessRules
		A new Active Directory environment comes with more deployed security delegations than defined in the schema.
		Several containers - especially the BuiltIn container - have a lot of extra access rules.
		When deploying a restrictive domain content mode, where these objects fall under management, it becomes necessary to also configure these delegations, lest they be removed.
		Setting this switch will include all the default delegations in your new context.
	
	.PARAMETER Force
		This command refuses to replace an existing context by default.
		Using force, it is a bit more brutish and will kill any previously existing context with the same name in the target store.
	
	.PARAMETER EnableException
		This parameters disables user-friendly warnings and enables the throwing of exceptions.
		This is less user friendly, but allows catching exceptions in calling scripts.
	
	.EXAMPLE
		PS C:\> New-AdmfContext -Name 'newContext'
		
		Creates a new context named "newContext"
	
	.EXAMPLE
		PS C:\> New-AdmfContext -Name 'Contoso_Baseline' -Store Company -Weight 10 -Author "Sad Joey" -DefaultccessRules -Description "Default baseline for contoso company forests"
		
		Creates a new context ...
		- Named "Contoso_Baseline"
		- In the context store "Company"
		- With the weight 10 (very low, causing it to be one of the first to be applied)
		- By Sad Joey (a great and non-sad person)
		- that contains the default access rules
		- has a useful description of what it is for
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
	[CmdletBinding(DefaultParameterSetName = 'Store')]
	param (
		[Parameter(Mandatory = $true)]
		[PsfValidatePattern('^[\w\d_\-\.]+$', ErrorString = 'ADMF.Validate.Pattern.ContextName')]
		[string]
		$Name,
		
		[Parameter(ParameterSetName = 'Store')]
		[PsfValidateSet(TabCompletion = 'ADMF.Context.Store')]
		[string]
		$Store = 'Default',
		
		[Parameter(ParameterSetName = 'Path')]
		[PsfValidateScript('ADMF.Validate.Path.Folder', ErrorString = 'ADMF.Validate.Path.Folder')]
		[string]
		$OutPath,
		
		[int]
		$Weight = 50,
		
		[string]
		$Description = "<Insert description-text here>",
		
		[string]
		$Author = "<Insert your name here>",
		
		[string]
		$Group = 'Default',
		
		[string[]]
		$Prerequisite = @(),
		
		[string[]]
		$MutuallyExclusive = @(),
		
		[switch]
		$DefaultAccessRules,
		
		[switch]
		$Force,
		
		[switch]
		$EnableException
	)
	
	begin
	{
		if ($OutPath)
		{
			$resolvedPath = Resolve-PSFPath -Provider FileSystem -Path $OutPath -SingleItem
			if (-not $Force -and (Test-Path -Path "$resolvedPath\$Name"))
			{
				Stop-PSFFunction -String 'New-AdmfContext.Context.AlreadyExists' -StringValues $resolvedPath, $Name -EnableException $EnableException -Category InvalidArgument -Cmdlet $PSCmdlet
				return
			}
		}
		else
		{
			$storeObject = Get-AdmfContextStore -Name $Store
			if (-not $Force -and (Test-Path -Path "$($storeObject.Path)\$Name"))
			{
				Stop-PSFFunction -String 'New-AdmfContext.Context.AlreadyExists2' -StringValues $Store, $Name -EnableException $EnableException -Category InvalidArgument -Cmdlet $PSCmdlet
				return
			}
			if (-not (Test-Path -Path $storeObject.Path))
			{
				$null = New-Item -Path $storeObject.Path -ItemType Directory -Force
			}
			$resolvedPath = Resolve-PSFPath -Provider FileSystem -Path $storeObject.Path -SingleItem
		}
	}
	process
	{
		if (Test-PSFFunctionInterrupt) { return }
		
		# This can only be $true when -Force was used, as otherwise it would fail in begin
		if (Test-Path -Path "$resolvedPath\$Name") { Remove-Item -Path "$resolvedPath\$Name" -Recurse -Force }
		
		$contextFolder = New-Item -Path $resolvedPath -Name $Name -ItemType Directory
		$contextVersionFolder = New-Item -Path $contextFolder.FullName -Name '1.0.0' -ItemType Directory
		Copy-Item -Path "$script:ModuleRoot\internal\data\context\*" -Destination "$($contextVersionFolder.FullName)\" -Recurse
		
		#region Default Access Rules
		if ($DefaultAccessRules){
			Copy-Item -Path "$script:ModuleRoot\internal\data\domainDefaults\accessRules\*.json" -Destination "$($contextVersionFolder.FullName)\domain\accessrules\"
			Copy-Item -Path "$script:ModuleRoot\internal\data\domainDefaults\objectCategories\*.psd1" -Destination "$($contextVersionFolder.FullName)\domain\objectcategories\"
			Copy-Item -Path "$script:ModuleRoot\internal\data\domainDefaults\gppermissions\*.json" -Destination "$($contextVersionFolder.FullName)\domain\gppermissions\"
			Copy-Item -Path "$script:ModuleRoot\internal\data\domainDefaults\gppermissionfilters\*.json" -Destination "$($contextVersionFolder.FullName)\domain\gppermissionfilters\"
			
			Copy-Item -Path "$script:ModuleRoot\internal\data\forestDefaults\schemaDefaultPermissions\*.json" -Destination "$($contextVersionFolder.FullName)\forest\schemaDefaultPermissions\"
		}
		#endregion Default Access Rules
		
		$contextJson = [pscustomobject]@{
			Version	      = '1.0.0'
			Weight	      = $Weight
			Description   = $Description
			Author	      = $Author
			Prerequisites = $Prerequisite
			MutuallyExclusive = $MutuallyExclusive
			Group		  = $Group
		}
		$contextJson | ConvertTo-Json | Set-Content -Path "$($contextVersionFolder.FullName)\context.json"
		
		Get-AdmfContext -Name $Name -Store $Store
	}
}