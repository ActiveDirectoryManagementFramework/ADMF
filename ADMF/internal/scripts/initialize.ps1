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

Set-PSFTypeAlias -Mapping @{
	'UpdateDomainOptions' = 'ADMF.UpdateDomainOptions'
	'UpdateForestOptions' = 'ADMF.UpdateForestOptions'
}

Register-AdmfCredentialProvider -Name default -PreScript {
	param (
		$Data
	)
	$Data.Credential
}