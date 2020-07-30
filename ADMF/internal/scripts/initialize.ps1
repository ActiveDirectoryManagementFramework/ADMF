$callbackScript = {
	[CmdletBinding()]
	param (
		[AllowNull()]
		$Server,
		
		[AllowNull()]
		$Credential,
		
		[AllowNull()]
		$ForestObject,
		
		[AllowNull()]
		$DomainObject
	)
	
	$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
	if ($parameters.Server -eq '<Default Domain>') { $parameters.Server = $env:USERDNSDOMAIN }
	Set-AdmfContext @parameters -Interactive -ReUse -EnableException
}
Register-DMCallback -Name ADMF -ScriptBlock $callbackScript
Register-FMCallback -Name ADMF -ScriptBlock $callbackScript

$callbackScript2 = {
	[CmdletBinding()]
	param (
		[Hashtable]
		$Data
	)
	
	# If this is a DC Installation command from DC Management and we disabled the prompt in configuration, stop
	if ($Data.Data.IsDCInstall -and -not (Get-PSFConfigValue -FullName 'ADMF.DCInstall.Context.Prompt.Enable')) { return }
	
	$parameters = $Data.Data | ConvertTo-PSFHashtable -Include Server, Credential
	if ($parameters.Server -eq '<Default Domain>') { $parameters.Server = $env:USERDNSDOMAIN }
	if (-not $parameters.Server) { $parameters.Server = $env:USERDNSDOMAIN }
	Set-AdmfContext @parameters -Interactive -ReUse -EnableException
}
Register-PSFCallback -Name 'ADMF.ContextPrompt' -ModuleName DCManagement -CommandName '*' -ScriptBlock $callbackScript2

Set-PSFTypeAlias -Mapping @{
	'UpdateDCOptions'	  = 'ADMF.UpdateDCOptions'
	'UpdateDomainOptions' = 'ADMF.UpdateDomainOptions'
	'UpdateForestOptions' = 'ADMF.UpdateForestOptions'
}

Register-AdmfCredentialProvider -Name default -PreScript {
	param (
		$Data
	)
	$Data.Credential
}