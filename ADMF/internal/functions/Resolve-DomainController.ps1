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
	
	.EXAMPLE
		PS C:\> Resolve-DomainController @parameters

		Picks the server to work against.
	#>
	[OutputType([string])]
	[CmdletBinding()]
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
		$target = $Server
		if (-not $target) { $target = $env:USERDNSNAME }
		Invoke-PSFProtectedCommand -ActionString 'Resolve-DomainController.Connecting' -ActionStringValues $target -Target $target -ScriptBlock {
			$domainController = Get-ADDomainController @parameters -ErrorAction Stop
		} -PSCmdlet $PSCmdlet -EnableException $true -RetryCount 5 -RetryWait 2
		
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
