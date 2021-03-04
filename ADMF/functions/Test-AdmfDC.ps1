function Test-AdmfDC
{
<#
	.SYNOPSIS
		Tests whether all DCs in the target domain are in the desired state.
	
	.DESCRIPTION
		Tests whether all DCs in the target domain are in the desired state.
	
	.PARAMETER Server
		The server / domain to work with.
		
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.PARAMETER Options
		What tests to execute.
		Defaults to all tests.

	.PARAMETER CredentialProvider
		The credential provider to use to resolve the input credentials.
		See help on Register-AdmfCredentialProvider for details.
	
	.PARAMETER ContextPrompt
		Force displaying the Context selection User Interface.
	
	.EXAMPLE
		PS C:\> Test-AdmfDC
	
		Tests the current domain's DCs whether they are compliant with the desired/defined state
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
	[CmdletBinding()]
	param (
		[PSFComputer]
		$Server,
		
		[PSCredential]
		$Credential,
		
		[UpdateDCOptions[]]
		$Options = 'All',
		
		[string]
		$CredentialProvider = 'default',
		
		[Alias('Ctx')]
		[switch]
		$ContextPrompt
	)
	
	begin
	{
		Reset-DomainControllerCache
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		$originalArgument = Invoke-PreCredentialProvider @parameters -ProviderName $CredentialProvider -Parameter $parameters -Cmdlet $PSCmdlet
		try { $parameters.Server = Resolve-DomainController @parameters -ErrorAction Stop -Confirm:$false }
		catch
		{
			Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet
			throw
		}
		Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
		Set-AdmfContext @parameters -Interactive -ReUse:$(-not $ContextPrompt) -EnableException
		[UpdateDCOptions]$newOptions = $Options
	}
	process
	{
		try
		{
			if ($newOptions -band [UpdateDCOptions]::Share)
			{
				if (Get-DCShare)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDC.Executing.Test' -StringValues 'Shares', $parameters.Server
					Test-DCShare @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDC.Skipping.Test.NoConfiguration' -StringValues 'Shares' }
			}
			if ($newOptions -band [UpdateDCOptions]::FSAccessRule)
			{
				if (Get-DCAccessRule)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDC.Executing.Test' -StringValues 'FSAccessRules', $parameters.Server
					Test-DCAccessRule @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDC.Skipping.Test.NoConfiguration' -StringValues 'FSAccessRules' }
			}
		}
		catch { throw }
		finally { Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet }
	}
}