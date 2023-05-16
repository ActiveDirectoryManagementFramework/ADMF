function New-AdmfContextModule {
    <#
    .SYNOPSIS
        Create an ADMF Client PowerShell module.
    
    .DESCRIPTION
        Create an ADMF Client PowerShell module.
        Specify which contexts to use from a repository to which they have previously been published.

		It will then dynamically create a PowerShell module containing all contexts and their
		dependencies and publish them under its own Context store once imported.
    
    .PARAMETER Name
        Name of the contexts to include.
        Supports plain "Name" or the PowerShell module notation.
        Examples:
        "Default"
        @{ ModuleName = 'SecBaseline' }
        @{ ModuleName = 'SecBaseline'; ModuleVersion = '2.0.0' }
        @{ ModuleName = 'SecBaseline'; RequiredVersion = '2.3.1' }
    
    .PARAMETER Repository
        Name of the repository to download from.
    
    .PARAMETER Path
        Path where to write the finished module to.
    
    .PARAMETER ModuleName
        Name of the module to generate.
    
    .PARAMETER ModuleOption
        Additional options to include in the module code when generating the module.
        Confirm: Injects all ADMF component modules with the requirement to confirm all changes.
    
    .PARAMETER AliasPrefix
        Create aliases for the common ADMF commands.
        This simplifies guiding users into loading the module containing their configuration settings.
        Rather than having them run Test-ADMFDomain, you could have them run Test-ConDomain,
        which would then implicitly load the generated module and make the contexts available,
        without having to first manually import the module generated.
    
    .PARAMETER ModuleVersion
        The version of the module to generate.
        Defaults to 1.0.0

    .PARAMETER Credential
        Credentials to use for accessing the powershell repository.

	.PARAMETER ModuleCode
		Additional code to iunclude in the module generated

	.PARAMETER GetV3
		Use PowerShellGet V3 or later.
		Defaults to the configuration setting of ADMF.PowerShellGet.UseV3.
    
    .EXAMPLE
        PS C:\> New-AdmfContextModule -Name Default -Repository Contoso -Path . -ModuleName Whatever -ModuleOption Confirm -AliasPrefix WE

        Retrieves the "Default" context from the "Contoso" repository.
        It will then wrap it into a module named "Whatever", injecting a requirement to confirm all changes and include
        aliases for the common ADMF commands with the WE prefix (e.g. Test-WEDomain)
    #>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        $Name,

        [Parameter(Mandatory = $true)]
        [string]
        $Repository,

        [Parameter(Mandatory = $true)]
        [string]
        $Path,

        [Parameter(Mandatory = $true)]
        [string]
        $ModuleName,

        [ValidateSet('Confirm')]
        [string[]]
        $ModuleOption = 'Confirm',

        [string]
        $AliasPrefix,

        [version]
        $ModuleVersion = '1.0.0',

        [PSCredential]
        $Credential,

		[ScriptBlock]
		$ModuleCode,

		[switch]
		$GetV3
    )

    trap {
        Remove-PSFTempItem -ModuleName ADMF -Name *
        throw $_
    }

    # Resolve Target Module Names / Versions
    $modules = foreach ($entry in $Name) {
        if ($entry -is [string]) {
            @{ Name = $entry }
        }
        else {
            $entry | ConvertTo-PSFHashtable Name, ModuleVersion, RequiredVersion
        }
    }
    foreach ($module in $modules) {
        if ($module.Name -notlike 'ADMF.Context.*') {
            $module.Name = "ADMF.Context.$($module.Name)"
        }
		if ($GetV3) {
			$module.Remove('ModuleVersion')
			if ($module.RequiredVersion) {
				$module.Version = $module.RequiredVersion
				$module.Remove('RequiredVersion')
			}
		}
		else {
			if ($module.ModuleVersion) {
				$module.MinimumVersion = $module.ModuleVersion
				$module.Remove('ModuleVersion')
			}
		}
    }

    # Create TEMP folder and deploy them from repository
    $folder = New-PSFTempDirectory -Name contextpath -ModuleName ADMF
    $moduleParam = $PSBoundParameters | ConvertTo-PSFHashtable -Include Repository, Credential
    foreach ($module in $modules) {
		if ($GetV3) {
			Save-PSResource @moduleParam @module -Path $folder
		}
		else {
			Save-Module @moduleParam @module -Path $folder
		}
    }

    # Create Module & Copy Contexts
    $moduleRoot = New-PSFTempDirectory -Name moduleroot -ModuleName ADMF -DirectoryName $ModuleName
    $manifest = @{
        Path              = "$moduleRoot\$ModuleName.psd1"
        ModuleVersion     = $ModuleVersion
        RootModule        = "$ModuleName.psm1"
        FunctionsToExport = @()
        CmdletsToExport   = @()
        AliasesToExport   = @()
        VariablesToExport = @()
    }
    if ($AliasPrefix) {
        $manifest.AliasesToExport = "Invoke-$($aliasPrefix)Forest", "Invoke-$($aliasPrefix)Domain", "Invoke-$($aliasPrefix)DC", "Invoke-$($aliasPrefix)Item", "Test-$($aliasPrefix)Domain", "Test-$($aliasPrefix)DC", "Test-$($aliasPrefix)Forest"
    }
    New-ModuleManifest @manifest
    $null = New-Item -Path $moduleRoot -Name "$ModuleName.psm1" -ItemType File
    $contextRoot = New-Item -Path $moduleRoot -Name Contexts -ItemType Directory

    $contextConfig = Get-Item -Path "$folder/*/*/*/*/context.json"
    $contextPaths = $contextConfig.FullName | Split-Path | Split-Path | Sort-Object -Unique
    foreach ($contextPath in $contextPaths) {
        Copy-Item -Path $contextPath -Destination $contextRoot.FullName -Recurse -Force
    }

    # Add module content
    $content = @()
    ## Register Context Store
    $content += "Set-PSFConfig -FullName 'ADMF.Context.Store.$ModuleName' -Value `"`$PSScriptRoot\Contexts`""
    ## Confirm Preference
    if ($ModuleOption -contains 'Confirm') {
        $content += @'
# Confirm by default
& (Get-Module DCManagement) { $script:ConfirmPreference = 'Low' }
& (Get-Module DomainManagement) { $script:ConfirmPreference = 'Low' }
& (Get-Module ForestManagement) { $script:ConfirmPreference = 'Low' }
'@
    }
    ## Add Alias for the ADMF Commands
    if ($AliasPrefix) {
        $content += "`$aliasPrefix = '$aliasPrefix'"
        $content += @'

# Set Aliases for module
$aliases = @{
    'Invoke-AdmfDC' = "Invoke-$($aliasPrefix)DC"
    'Invoke-AdmfDomain' = "Invoke-$($aliasPrefix)Domain"
    'Invoke-AdmfForest' = "Invoke-$($aliasPrefix)Forest"
    'Invoke-AdmfItem' = "Invoke-$($aliasPrefix)Item"
    'Test-AdmfDC' = "Test-$($aliasPrefix)DC"
    'Test-AdmfDomain' = "Test-$($aliasPrefix)Domain"
    'Test-AdmfForest' = "Test-$($aliasPrefix)Forest"
}
foreach ($pair in $aliases.GetEnumerator()) {
    Set-Alias -Name $pair.Value -Value $pair.Key
}
'@
    }
	## Add Custom Code
	if ($ModuleCode) {
		$content += $ModuleCode.ToString()
	}
    $content | Set-Content -Path "$moduleRoot\$ModuleName.psm1"

    # Copy to destination
    Copy-Item -Path $moduleRoot -Destination $Path -Recurse


    Remove-PSFTempItem -ModuleName ADMF -Name *
}