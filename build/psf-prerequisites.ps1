<#
Uses PSFramework.Nuget to install all modules required to run the pipeline.
#>
[CmdletBinding()]
param (
    [string]
    $Repository = 'PSGallery'
)

Invoke-WebRequest 'https://raw.githubusercontent.com/PowershellFrameworkCollective/PSFramework.NuGet/refs/heads/master/bootstrap.ps1' -UseBasicParsing | Invoke-Expression
Install-PSFPowerShellGet

$modules = @(
	'Pester' # Testing Framework
	'PSScriptAnalyzer' # Best Practices Analyzer used during tests
	'PSModuleDevelopment' # Potentially used in Tests or Publish
)

# Automatically add missing dependencies
$data = Import-PowerShellDataFile -Path "$PSScriptRoot\..\ADMF\ADMF.psd1"
foreach ($dependency in $data.RequiredModules) {
    if ($dependency -is [string]) {
        if ($modules -contains $dependency) { continue }
        $modules += $dependency
    }
    else {
        if ($modules -contains $dependency.ModuleName) { continue }
        $modules += $dependency.ModuleName
    }
}

Install-PSFModule -Name $modules -Repository $Repository -TrustRepository