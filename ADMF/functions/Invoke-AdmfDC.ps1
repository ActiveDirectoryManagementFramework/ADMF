function Invoke-AdmfDC
{
<#
	.SYNOPSIS
		Brings all DCs of the target domain into the desired/defined state.
	
	.DESCRIPTION
		Brings all DCs of the target domain into the desired/defined state.
	
	.PARAMETER Server
		The server / domain to work with.
	
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.PARAMETER Options
		Which aspects to actually update.
		By default, all Components are applied.

	.PARAMETER CredentialProvider
		The credential provider to use to resolve the input credentials.
		See help on Register-AdmfCredentialProvider for details.
	
	.PARAMETER ContextPrompt
		Force displaying the Context selection User Interface.

	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
	
	.EXAMPLE
		PS C:\> Invoke-AdmfDC -Server corp.contoso.com
	
		Brings all DCs of the domain corp.contoso.com into the desired/defined state.
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
	param (
		[PSFComputer]
		$Server,
		
		[PSCredential]
		$Credential,
		
		[ADMF.UpdateDCOptions[]]
		$Options = 'Default',
		
		[string]
		$CredentialProvider = 'default',
		
		[Alias('Ctx')]
		[switch]
		$ContextPrompt
	)
	
	begin
	{
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		$originalArgument = Invoke-PreCredentialProvider @parameters -ProviderName $CredentialProvider -Parameter $parameters -Cmdlet $PSCmdlet
		try { $dcServer = Resolve-DomainController @parameters -Confirm:$false }
		catch
		{
			Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet
			throw
		}
		$parameters.Server = $dcServer
		Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
		Set-AdmfContext @parameters -Interactive -ReUse:$(-not $ContextPrompt) -EnableException
		$parameters += $PSBoundParameters | ConvertTo-PSFHashtable -Include WhatIf, Confirm, Verbose, Debug
		$parameters.Server = $dcServer
		[ADMF.UpdateDCOptions]$newOptions = $Options
	}
	process
	{
		try
		{
			if ($newOptions -band [ADMF.UpdateDCOptions]::Share)
			{
				if (Get-DCShare)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfDC.Executing.Invoke' -StringValues 'Shares', $parameters.Server
					Invoke-DCShare @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDC.Skipping.Test.NoConfiguration' -StringValues 'Shares' }
			}
			if ($newOptions -band [ADMF.UpdateDCOptions]::FSAccessRule)
			{
				if (Get-DCAccessRule)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfDC.Executing.Invoke' -StringValues 'FSAccessRules', $parameters.Server
					Invoke-DCAccessRule @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDC.Skipping.Test.NoConfiguration' -StringValues 'FSAccessRules' }
			}
		}
		catch { throw }
		finally { Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet }
	}
}