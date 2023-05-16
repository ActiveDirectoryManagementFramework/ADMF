function Publish-AdmfContext {
	<#
    .SYNOPSIS
        Publishes a Context as a PowerShell Package.
    
    .DESCRIPTION
        Publishes a Context as a PowerShell Package.
        This wraps a Context as its own PowerShell module named "ADMF.Context.<ContextName>".

        It uses the version number in the context.json for the module version.
        All dependent contexts are declared as a module dependency following the same naming scheme.
    
    .PARAMETER Path
        Path to the Context to publish.
    
    .PARAMETER Name
        Name of the Context to publish.
        Will search known Context stores for available Contexts.
    
    .PARAMETER Store
        Store to search for the Context to publish.
        Will search all stores if not otherwise specified.
    
    .PARAMETER Version
        Version of the Context to publish.
        Will publish the latest version if not specified.
    
    .PARAMETER Repository
        Repository to publish the Context to.
    
    .PARAMETER ApiKey
        API Key of the repository to publish to.
        Defaults to "Whatever"

	.PARAMETER GetV3
		Use PowerShellGet V3 or later.
		Defaults to the configuration setting of ADMF.PowerShellGet.UseV3.
    
    .EXAMPLE
        PS C:\> Publish-AdmfContext -Path 'C:\ADMF\Default\1.0.0' -Repository Contoso

        Publishes the "Default" Context to the Contoso repository
    #>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ParameterSetName = 'Path')]
		[string]
		$Path,

		[Parameter(Mandatory = $true, ParameterSetName = 'Store')]
		[string]
		$Name,
        
		[Parameter(ParameterSetName = 'Store')]
		[string]
		$Store,

		[Parameter(ParameterSetName = 'Store')]
		[version]
		$Version,
        
		[Parameter(Mandatory = $true)]
		[string]
		$Repository,

		[string]
		$ApiKey = 'whatever',

		[switch]
		$GetV3 = (Get-PSFConfigValue -FullName ADMF.PowerShellGet.UseV3 -Fallback $false)
	)

	begin {
		function ConvertTo-Prerequisite {
			[OutputType([hashtable])]
			[CmdletBinding()]
			param (
				[Parameter(ValueFromPipeline = $true)]
				$InputObject
			)

			process {
				if ($InputObject -is [string]) { return @{ ModuleName = $InputObject } }
				$InputObject | ConvertTo-PSFHashtable -Include ModuleName, ModuleVersion, RequiredVersion
			}
		}
	}

	process {
		trap {
			Remove-PSFTempItem -ModuleName ADMF -Name *
			if ($originalPath) { $env:PSModulePath = $originalPath }
			throw $_
		}

		# Determine Path
		switch ($PSCmdlet.ParameterSetName) {
			Path { $contextRoot = $Path }
			Store {
				$param = @{
					Name = $Name
					All  = $true
				}
				if ($Store) { $param.Store = $Store }
				$context = Get-AdmfContext @param | Where-Object Name -EQ $Name
				if ($Version) { $context = $context | Where-Object Version -EQ $Version }
				$context = $context | Sort-Object Version -Descending | Select-Object -First 1
				$contextRoot = $context.Path
			}
		}

		# Determine Name, Author, Description, Version & Dependencies
		$ctxName = Split-Path (Split-Path $contextRoot) -Leaf
		$configFile = Join-Path $contextRoot 'context.json'
		$config = Import-PSFPowerShellDataFile -Path $configFile
		if ($config.Name) { $ctxName = $config.Name }

		$ctxDescription = $config.Description
		$ctxAuthor = $config.Author
		$ctxVersion = $config.Version
		$requirements = $config.Prerequisites | ForEach-Object {
			@{
				ModuleName    = "ADMF.Context.$_"
				ModuleVersion = '1.0.0'
				# RequiredVersion = $null
			}
		}
		if ($config.Requirements) {
			$requirements = $config.Requirements
		}

		# Build Dynamic Module
		$moduleName = "ADMF.Context.$ctxName"
		$folder = New-PSFTempDirectory -Name context -ModuleName ADMF -DirectoryName $moduleName
		$null = New-Item -Path $folder -Name "$moduleName.psm1" -ItemType File
		$param = @{
			Path              = "$folder\$moduleName.psd1"
			RootModule        = "$moduleName.psm1"
			Author            = $ctxAuthor
			Description       = $ctxDescription
			ModuleVersion     = $ctxVersion
			FunctionsToExport = @()
			CmdletsToExport   = @()
			AliasesToExport   = @()
			VariablesToExport = @()
		}
		if ($requirements) {
			$param.RequiredModules = $requirements | ConvertTo-Prerequisite
		}
		New-ModuleManifest @param
		$null = New-Item -Path "$folder\$ctxName\$ctxVersion" -ItemType Directory
		Copy-Item -Path "$($contextRoot -replace '\\$')\*" -Destination "$folder\$ctxName\$ctxVersion\" -Recurse

		# Create Temporary Modulepath and prepare dependencies
		$modulePath = New-PSFTempDirectory -Name modulepath -ModuleName ADMF
		$originalPath = $env:PSModulePath
		$env:PSModulePath = '{0};{1}' -f $modulePath, $env:PSModulePath
		foreach ($requirement in $requirements) {
			Save-Module -Repository $Repository -Path $modulePath @requirement
		}

		# Publish
		if ($GetV3) {
			$publish = @{
				Repository = $Repository
				Path       = $folder
			}
			if ($PSBoundParameters.Keys -contains 'ApiKey') { $publish.APiKey = $ApiKey }
			Publish-PSResource @publish
		}
		else {
			Publish-Module -Path $folder -Repository $Repository -NuGetApiKey $ApiKey
		}

		Remove-PSFTempItem -ModuleName ADMF -Name *
		$env:PSModulePath = $originalPath
	}
}