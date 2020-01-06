<#
	.SYNOPSIS
		Tests, whether the context should be checked by default.

	.DESCRIPTION
		If this script returns true, then the context will be automatically checked when setting up the prompt GUI.
		For performance reasons, this file should be removed if there is no way this can ever be $true

		This allows reducing user error, by smartly detecting whether a context should be checked, when you have a way to determine that automatically.
	
	.PARAMETER Server
		The server / domain to work with.
	
	.PARAMETER Credential
		The credentials to use for this operation.
#>
param (
	[PSFComputer]
	$Server,
	
	[System.Management.Automation.PSCredential]
	$Credential
)

$false