﻿<#
This is an example configuration file

By default, it is enough to have a single one of them,
however if you have enough configuration settings to justify having multiple copies of it,
feel totally free to split them into multiple files.
#>

<#
# Example Configuration
Set-PSFConfig -Module 'ADMF' -Name 'Example.Setting' -Value 10 -Initialize -Validation 'integer' -Handler { } -Description "Example configuration setting. Your module can then use the setting using 'Get-PSFConfigValue'"
#>

Set-PSFConfig -Module 'ADMF' -Name 'Import.DoDotSource' -Value $false -Initialize -Validation 'bool' -Description "Whether the module files should be dotsourced on import. By default, the files of this module are read as string value and invoked, which is faster but worse on debugging."
Set-PSFConfig -Module 'ADMF' -Name 'Import.IndividualFiles' -Value $false -Initialize -Validation 'bool' -Description "Whether the module files should be imported individually. During the module build, all module code is compiled into few files, which are imported instead by default. Loading the compiled versions is faster, using the individual files is easier for debugging and testing out adjustments."

Set-PSFConfig -Module 'ADMF' -Name 'DCSelectionMode' -Value 'PDCEmulator' -Initialize -Validation 'DCSelectionMode' -Description 'When executing commands, specifying the domain name will cause the module to resolve to a single DC to work against. This setting governs the algorythm that determines the DC to work against. Either "PDCEmulator", "Site" or "Random" are valid choices. When using site, specify the "ADMF.DCSelection.Site" setting as well to select the site to prefer.'
Set-PSFConfig -Module 'ADMF' -Name 'DCSelection.Site' -Value '' -Initialize -Validation 'stringarray' -Description 'When using the "ADMF.DCSelectionMode" in "Site" mode, specifying this setting will pick the site to chose. If there are multiple DCs in the target site, the PDCEmulator will be preferred if present.'
Set-PSFConfig -Module 'ADMF' -Name 'DCSelection.Site.Prioritize' -Value $true -Initialize -Validation bool -Description 'When using the "ADMF.DCSelectionMode" in "Site" mode, this setting governs whether all sites are pooled ($false) or whether processed one after the other until a valid DC has been found ($true).'

Set-PSFConfig -Module 'ADMF' -Name 'VerboseExecution' -Value $true -Initialize -Validation bool -Handler {
	if ($args[0])
	{
		$null = New-PSFMessageLevelModifier -Name ADMF_Verbose -Modifier 0 -IncludeModuleName ADMF
	}
	else
	{
		$null = New-PSFMessageLevelModifier -Name ADMF_Verbose -Modifier 3 -IncludeModuleName ADMF
	}
} -Description 'Enabling this will cause the ADMF module to be more verbose by default'

Set-PSFConfig -Module 'ADMF' -Name 'Context.Store.Default' -Value "$(Get-PSFPath -Name AppData)\ADMF\Contexts" -Initialize -Validation string -Description 'The default path in which ADMF will look for configuration contexts. Add additional such paths by declaring additional settings labeled "ADMF.Context.Store.*"'
Set-PSFConfig -Module 'ADMF' -Name 'DCInstall.Context.Prompt.Enable' -Value $true -Initialize -Validation 'bool' -Description "Whether the DC installation commands should generate Context selection prompts."

Set-PSFConfig -Module 'ADMF' -Name 'PowerShellGet.UseV3' -Value $false -Initialize -Validation bool -Description 'Whether to use PowerShellGet V3 by default or not.'