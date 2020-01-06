function Test-AdmfDomain
{
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
	
	.EXAMPLE
		PS C:\> Test-AdmfDomain -Server corp.fabrikam.com

		Scans the domain corp.fabrikam.com for compliance with the desired state.
	#>
	[CmdletBinding()]
	Param (
		[PSFComputer]
		$Server,

		[PSCredential]
		$Credential,

		[UpdateDomainOptions[]]
		$Options = 'All'
	)
	
	begin
	{
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		try { $parameters.Server = Resolve-DomainController @parameters -ErrorAction Stop }
		catch { throw }
		Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
		[UpdateDomainOptions]$newOptions = $Options
	}
	process
	{
		try
		{
			if (($newOptions -band [UpdateDomainOptions]::OUSoft) -or ($newOptions -band [UpdateDomainOptions]::OUHard)) {
				if (Get-DMOrganizationalUnit)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'OrganizationalUnits', $parameters.Server
					Test-DMOrganizationalUnit @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'OrganizationalUnits' }
			}
			if ($newOptions -band [UpdateDomainOptions]::Group) {
				if (Get-DMGroup)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Groups', $parameters.Server
					Test-DMGroup @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Groups' }
			}
			if ($newOptions -band [UpdateDomainOptions]::User) {
				if (Get-DMUser)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Users', $parameters.Server
					Test-DMUser @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Users' }
			}
			if ($newOptions -band [UpdateDomainOptions]::GroupMembership) {
				if (Get-DMGroupMembership)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupMembership', $parameters.Server
					Test-DMGroupMembership @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupMembership' }
			}
			if ($newOptions -band [UpdateDomainOptions]::Acl) {
				if (Get-DMAcl)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Acls', $parameters.Server
					Test-DMAcl @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Acls' }
			}
			if ($newOptions -band [UpdateDomainOptions]::AccessRule) {
				if (Get-DMAccessRule)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'AccessRules', $parameters.Server
					Test-DMAccessRule @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'AccessRules' }
			}
			if ($newOptions -band [UpdateDomainOptions]::PSO) {
				if (Get-DMPasswordPolicy)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'PasswordPolicies', $parameters.Server
					Test-DMPasswordPolicy @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'PasswordPolicies' }
			}
			if ($newOptions -band [UpdateDomainOptions]::Object) {
				if (Get-DMObject)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Object', $parameters.Server
					Test-DMObject @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Object' }
			}
			if (($newOptions -band [UpdateDomainOptions]::GroupPolicy) -or ($newOptions -band [UpdateDomainOptions]::GroupPolicyDelete)) {
				if (Get-DMGroupPolicy)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicies', $parameters.Server
					Test-DMGroupPolicy @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicies' }
			}
			if ($newOptions -band [UpdateDomainOptions]::GPPermission) {
				Write-PSFMessage -Level Host -Message "Not implemented yet: <c='em'>Group Policy Permissions</c>"
				# Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicyPermissions', $parameters.Server
				# Test-DMGPPermission @parameters
			}
			if (($newOptions -band [UpdateDomainOptions]::GPLink) -or ($newOptions -band [UpdateDomainOptions]::GPLinkDisable)) {
				if (Get-DMGPLink)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicyLinks', $parameters.Server
					Test-DMGPLink @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicyLinks' }
			}
		}
		catch { throw }
	}
}
