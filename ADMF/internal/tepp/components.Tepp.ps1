Register-PSFTeppScriptblock -Name 'ADMF.Components' -ScriptBlock {
	& (Get-Module ADMF) { (Get-ChildItem -Path "$script:ModuleRoot\internal\components" -Directory).Name }
}