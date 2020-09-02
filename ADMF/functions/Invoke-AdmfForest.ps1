function Invoke-AdmfForest
{
	<#
	.SYNOPSIS
		Applies the currently desired configuration to the targeted forest.
	
	.DESCRIPTION
		Applies the currently desired configuration to the targeted forest.
		By default, this will only include sites, sitelinks and subnets.

		To switch to a full application, use the "-Options All" parameter.
	
	.PARAMETER Server
		The server / domain to work with.
	
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.PARAMETER Options
		Which aspects to actually update.
		Defaults to "default" (Sites, SiteLinks & Subnets)
		Also available:
		- ServerRelocate (reassigns domain controllers to correct sites, if necessary)
		- Schema (applies core schema updates)
		- SchemaLdif (applies product Ldif files, such as SkypeForBusiness)
		To update everything, use "All".

	.PARAMETER CredentialProvider
		The credential provider to use to resolve the input credentials.
		See help on Register-AdmfCredentialProvider for details.

	.PARAMETER Confirm
		If this switch is enabled, you will be prompted for confirmation before executing any operations that change state.
	
	.PARAMETER WhatIf
		If this switch is enabled, no actions are performed but informational messages will be displayed that explain what would happen if the command were to run.
	
	.EXAMPLE
		PS C:\> Invoke-AdmfForest -Server contoso.com -Options All

		Applies the full forest configuration to the contoso.com domain.
	#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
	Param (
		[PSFComputer]
		$Server,

		[PSCredential]
		$Credential,

		[ADMF.UpdateForestOptions[]]
		$Options = 'Default',

		[string]
		$CredentialProvider = 'default'
	)
	
	begin
	{
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		$originalArgument = Invoke-PreCredentialProvider @parameters -ProviderName $CredentialProvider -Parameter $parameters -Cmdlet $PSCmdlet
		try { $dcServer = Resolve-DomainController @parameters -Confirm:$false }
		catch {
			Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet
			throw
		}
		$parameters.Server = $dcServer
		Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
		Set-AdmfContext @parameters -Interactive -ReUse -EnableException
		$parameters += $PSBoundParameters | ConvertTo-PSFHashtable -Include WhatIf, Confirm, Verbose, Debug
		$parameters.Server = $dcServer
		[ADMF.UpdateForestOptions]$newOptions = $Options
	}
	process
	{
		try
		{
			if ($newOptions -band [UpdateForestOptions]::Sites)
			{
				if (Get-FMSite)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Sites', $parameters.Server
					Invoke-FMSite @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Sites' }
			}
			if ($newOptions -band [UpdateForestOptions]::SiteLinks)
			{
				if (Get-FMSiteLink)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Sitelinks', $parameters.Server
					Invoke-FMSiteLink @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Sitelinks' }
			}
			if ($newOptions -band [UpdateForestOptions]::Subnets)
			{
				if (Get-FMSubnet)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Subnets', $parameters.Server
					Invoke-FMSubnet @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Subnets' }
			}
			if ($newOptions -band [UpdateForestOptions]::ServerRelocate)
			{
				Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Server Site Assignment', $parameters.Server
				Invoke-FMServer @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::Schema)
			{
				if (Get-FMSchema)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Schema (Custom)', $parameters.Server
					Invoke-FMSchema @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Schema (Custom)' }
			}
			if ($newOptions -band [UpdateForestOptions]::SchemaLdif)
			{
				if (Get-FMSchemaLdif)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Schema (Ldif)', $parameters.Server
					Invoke-FMSchemaLdif @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Schema (Ldif)' }
			}
			if ($newOptions -band [UpdateForestOptions]::NTAuthStore)
			{
				if (Get-FMNTAuthStore)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'NTAuthStore', $parameters.Server
					Invoke-FMNTAuthStore @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'NTAuthStore' }
			}
			if ($newOptions -band [UpdateForestOptions]::ForestLevel)
			{
				if (Get-FMForestLevel)
				{
					Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'ForestLevel', $parameters.Server
					Invoke-FMForestLevel @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'ForestLevel' }
			}
		}
		catch { throw }
		finally { Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet }
	}
}