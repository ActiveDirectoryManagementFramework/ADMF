function Resolve-DomainController
{
	<#
	.SYNOPSIS
		Resolves a domain to a specific domaincontroller.
	
	.DESCRIPTION
		Resolves a domain to a specific domaincontroller.
	
	.PARAMETER Server
		The server / domain to work with.
	
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.PARAMETER Type
		The type of DC to resolve to.
		Governed by the 'ADMF.DCSelectionMode' configuration setting.
	
	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
	
	.EXAMPLE
		PS C:\> Resolve-DomainController @parameters

		Picks the server to work against.
	#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseDeclaredVarsMoreThanAssignments", "")]
	[OutputType([string])]
	[CmdletBinding(SupportsShouldProcess = $true)]
	param (
		[PSFComputer]
		$Server,
		
		[PSCredential]
		$Credential,

		[ValidateSet('PDCEmulator', 'Random')]
		[string]
		$Type = (Get-PSFConfigValue -FullName 'ADMF.DCSelectionMode' -Fallback 'PDCEmulator')
	)
	
	begin
	{
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		$parameters['Debug'] = $false
	}
	process
	{
		$targetString = $Server
		if (-not $targetString) { $targetString = $env:USERDNSNAME }
		$null = Invoke-PSFProtectedCommand -ActionString 'Resolve-DomainController.Connecting' -ActionStringValues $targetString -Target $targetString -ScriptBlock {
			$domainController = Get-ADDomainController @parameters -ErrorAction Stop
		} -PSCmdlet $PSCmdlet -EnableException $true -RetryCount 5 -RetryWait 2 -Confirm:$false
		
		if ($domainController.HostName -eq $Server) {
			Write-PSFMessage -Level Host -String 'Resolve-DomainController.Resolved' -StringValues $domainController.HostName
			return $domainController.HostName
		}
		if ($domainController.Name -eq $Server) {
			Write-PSFMessage -Level Host -String 'Resolve-DomainController.Resolved' -StringValues $domainController.Name
			return $domainController.Name
		}

		switch ($Type) {
			'Random' {
				Write-PSFMessage -Level Host -String 'Resolve-DomainController.Resolved' -StringValues $domainController.HostName
				return $domainController.HostName
			}
			default {
				$domain = Get-ADDomain @parameters
				Write-PSFMessage -Level Host -String 'Resolve-DomainController.Resolved' -StringValues $domain.PDCEmulator
				$domain.PDCEmulator
			}
		}
	}
}
