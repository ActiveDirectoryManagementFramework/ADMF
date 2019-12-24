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
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'OrganizationalUnits', $parameters.Server
				Test-DMOrganizationalUnit @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::Group) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Groups', $parameters.Server
				Test-DMGroup @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::User) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Users', $parameters.Server
				Test-DMUser @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::GroupMembership) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupMembership', $parameters.Server
				Test-DMGroupMembership @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::Acl) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Acls', $parameters.Server
				Test-DMAcl @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::AccessRule) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'AccessRules', $parameters.Server
				Test-DMAccessRule @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::PSO) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'PasswordPolicies', $parameters.Server
				Test-DMPasswordPolicy @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::Object) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'Object', $parameters.Server
				Test-DMObject @parameters
			}
			if (($newOptions -band [UpdateDomainOptions]::GroupPolicy) -or ($newOptions -band [UpdateDomainOptions]::GroupPolicyDelete)) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicies', $parameters.Server
				Test-DMGroupPolicy @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::GPPermission) {
				Write-PSFMessage -Level Host -Message "Not implemented yet: <c='em'>Group Policy Permissions</c>"
				# Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicyPermissions', $parameters.Server
				# Test-DMGPPermission @parameters
			}
			if (($newOptions -band [UpdateDomainOptions]::GPLink) -or ($newOptions -band [UpdateDomainOptions]::GPLinkDisable)) {
				Write-PSFMessage -Level Host -String 'Test-AdmfDomain.Executing.Test' -StringValues 'GroupPolicyLinks', $parameters.Server
				Test-DMGPLink @parameters
			}
		}
		catch { throw }
	}
}
