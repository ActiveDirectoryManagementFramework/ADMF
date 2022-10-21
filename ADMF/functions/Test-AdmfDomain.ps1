function Test-AdmfDomain {
	<#
	.SYNOPSIS
		Tests a domain for its domain level content and whether it matches the desired state.
	
	.DESCRIPTION
		Tests a domain for its domain level content and whether it matches the desired state.
		Executes a large battery of tests from the DomainManagement module.
		The desired state is defined using configuration files, which the module handles for the user.
	
	.PARAMETER Server
		The server / domain to work with.
	
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.PARAMETER Options
		Which scan to execute.
		By default, all tests are run, but it is possibly to selectively choose which to run.

	.PARAMETER CredentialProvider
		The credential provider to use to resolve the input credentials.
		See help on Register-AdmfCredentialProvider for details.
	
	.PARAMETER ContextPrompt
		Force displaying the Context selection User Interface.
	
	.EXAMPLE
		PS C:\> Test-AdmfDomain -Server corp.fabrikam.com

		Scans the domain corp.fabrikam.com for compliance with the desired state.
	#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
	[CmdletBinding()]
	Param (
		[PSFComputer[]]
		$Server,

		[PSCredential]
		$Credential,

		[UpdateDomainOptions[]]
		$Options = 'All',

		[string]
		$CredentialProvider = 'default',
		
		[Alias('Ctx')]
		[switch]
		$ContextPrompt
	)
	
	begin {
		[UpdateDomainOptions]$newOptions = $Options
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
				if (($newOptions -band [UpdateDomainOptions]::OUSoft) -or ($newOptions -band [UpdateDomainOptions]::OUHard)) {
					if (Get-DMOrganizationalUnit) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'OrganizationalUnits', $parameters.Server
						Test-DMOrganizationalUnit @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'OrganizationalUnits' }
				}
				if ($newOptions -band [UpdateDomainOptions]::Group) {
					if (Get-DMGroup) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Groups', $parameters.Server
						Test-DMGroup @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Groups' }
				}
				if ($newOptions -band [UpdateDomainOptions]::User) {
					if (Get-DMUser) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Users', $parameters.Server
						Test-DMUser @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Users' }
				}
				if ($newOptions -band [UpdateDomainOptions]::ServiceAccount) {
					if (Get-DMServiceAccount) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'ServiceAccounts', $parameters.Server
						Test-DMServiceAccount @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'ServiceAccounts' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GroupMembership) {
					if (Get-DMGroupMembership) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupMembership', $parameters.Server
						Test-DMGroupMembership @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupMembership' }
				}
				if ($newOptions -band [UpdateDomainOptions]::Acl) {
					if (Get-DMAcl | Remove-PSFNull) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Acls', $parameters.Server
						Test-DMAcl @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Acls' }
				}
				if ($newOptions -band [UpdateDomainOptions]::AccessRule) {
					if (Get-DMAccessRule) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'AccessRules', $parameters.Server
						Test-DMAccessRule @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'AccessRules' }
				}
				if ($newOptions -band [UpdateDomainOptions]::PSO) {
					if (Get-DMPasswordPolicy) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'PasswordPolicies', $parameters.Server
						Test-DMPasswordPolicy @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'PasswordPolicies' }
				}
				if ($newOptions -band [UpdateDomainOptions]::Object) {
					if (Get-DMObject) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Object', $parameters.Server
						Test-DMObject @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Object' }
				}
				if ($newOptions -band [UpdateDomainOptions]::WmiFilter) {
					if (Get-DMWmiFilter) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'WmiFilter', $parameters.Server
						Test-DMWmiFilter @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'WmiFilter' }
				}
				if (($newOptions -band [UpdateDomainOptions]::GroupPolicy) -or ($newOptions -band [UpdateDomainOptions]::GroupPolicyDelete)) {
					if (Get-DMGroupPolicy) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicies', $parameters.Server
						Test-DMGroupPolicy @parameters | Where-Object {
							($newOptions -band [UpdateDomainOptions]::GroupPolicyDelete) -or
							($_.Type -ne 'Delete')
						}
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicies' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GPPermission) {
					if (Get-DMGPPermission) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicyPermissions', $parameters.Server
						Test-DMGPPermission @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicyPermissions' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GPOwner) {
					if (Get-DMGPOwner) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicyOwners', $parameters.Server
						Test-DMGPOwner @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicyOwners' }
				}
				if (($newOptions -band [UpdateDomainOptions]::GPLink) -or ($newOptions -band [UpdateDomainOptions]::GPLinkDisable)) {
					if (Get-DMGPLink) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicyLinks', $parameters.Server
						Test-DMGPLink @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicyLinks' }
				}
				if ($newOptions -band [UpdateDomainOptions]::DomainLevel) {
					if (Get-DMDomainLevel) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'DomainLevel', $parameters.Server
						Test-DMDomainLevel @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'DomainLevel' }
				}
				if ($newOptions -band [UpdateDomainOptions]::Exchange) {
					if (Get-DMExchange) {
						Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Exchange System Objects', $parameters.Server
						Test-DMExchange @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Exchange System Objects' }
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