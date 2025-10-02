﻿function Test-AdmfForest {
	<#
	.SYNOPSIS
		Tests whether a forest is configured according to baseline configuration
	
	.DESCRIPTION
		Tests whether a forest is configured according to baseline configuration
	
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
		PS C:\> Test-AdmfForest

		Test the current forest for baseline compliance.
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
	[CmdletBinding()]
	Param (
		[PSFComputer[]]
		$Server,

		[PSCredential]
		$Credential,

		[UpdateForestOptions[]]
		$Options = 'All',

		[string]
		$CredentialProvider = 'default',
		
		[Alias('Ctx')]
		[switch]
		$ContextPrompt
	)
	
	begin {
		[UpdateForestOptions]$newOptions = $Options
	}
	process {
		foreach ($computer in $Server) {
			Reset-DomainControllerCache
			$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Credential
			$parameters.Server = $computer
			$originalArgument = Invoke-PreCredentialProvider @parameters -ProviderName $CredentialProvider -Parameter $parameters -Cmdlet $PSCmdlet
			try { $parameters.Server = Resolve-DomainController @parameters -ErrorAction Stop -Confirm:$false }
			catch {
				Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet
				Write-Error $_
				continue
			}
			Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
			Set-AdmfContext @parameters -Interactive -ReUse:$(-not $ContextPrompt) -EnableException
			try {
				if ($newOptions -band [UpdateForestOptions]::Sites) {
					if (Get-FMSite) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Sites', $parameters.Server
						Test-FMSite @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Sites' }
				}
				if ($newOptions -band [UpdateForestOptions]::SiteLinks) {
					if (Get-FMSiteLink) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Sitelinks', $parameters.Server
						Test-FMSiteLink @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Sitelinks' }
				}
				if ($newOptions -band [UpdateForestOptions]::Subnets) {
					if (Get-FMSubnet) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Subnets', $parameters.Server
						Test-FMSubnet @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Subnets' }
				}
				if ($newOptions -band [UpdateForestOptions]::ServerRelocate) {
					# Requires no configuration, so no check for configuration existence required
					Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Server Site Assignment', $parameters.Server
					Test-FMServer @parameters
				}
				if (
					($newOptions -band [UpdateForestOptions]::Schema) -or
					($newOptions -band [UpdateForestOptions]::SchemaManage)
				) {
					if (Get-FMSchema) {
						$manageParam = @{}
						if ($newOptions -band [UpdateForestOptions]::SchemaManage) { $manageParam.ReportUnconfigured = $true }
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Schema (Custom)', $parameters.Server
						Test-FMSchema @parameters @manageParam
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Schema (Custom)' }
				}
				if ($newOptions -band [UpdateForestOptions]::SchemaDefaultPermissions) {
					if (Get-FMSchemaDefaultPermission) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Schema Default Permissions', $parameters.Server
						Test-FMSchemaDefaultPermission @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Schema Default Permissions' }
				}
				if ($newOptions -band [UpdateForestOptions]::SchemaLdif) {
					if (Get-FMSchemaLdif) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Schema (Ldif)', $parameters.Server
						Test-FMSchemaLdif @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Schema (Ldif)' }
				}
				if ($newOptions -band [UpdateForestOptions]::NTAuthStore) {
					if (Get-FMNTAuthStore) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'NTAuthStore', $parameters.Server
						Test-FMNTAuthStore @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'NTAuthStore' }
				}
				if ($newOptions -band [UpdateForestOptions]::Certificates) {
					if (Get-FMCertificate) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Certificate', $parameters.Server
						Test-FMCertificate @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Certificate' }
				}
				if ($newOptions -band [UpdateForestOptions]::ForestLevel) {
					if (Get-FMForestLevel) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'ForestLevel', $parameters.Server
						Test-FMForestLevel @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'ForestLevel' }
				}
				if ($newOptions -band [UpdateForestOptions]::ExchangeSchema) {
					if (Get-FMExchangeSchema) {
						Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'ExchangeSchema', $parameters.Server
						Test-FMExchangeSchema @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'ExchangeSchema' }
				}
			}
			catch {
				Write-Error $_
				continue
			}
			finally {
				Disable-PSFConsoleInterrupt
				try { Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet }
				finally { Enable-PSFConsoleInterrupt }
			}
		}
	}
}