function Invoke-AdmfDomain
{
	<#
	.SYNOPSIS
		Brings a domain into compliance with the desired state.
	
	.DESCRIPTION
		Brings a domain into compliance with the desired state.
		It implements a wide variety of settings against the targeed domain,
		whether it be OUs, groups, users, gpos, acls or many more items.

		Note on order:
		- OU Creation and Updating should be done first, but DELETING ous (OUHard) should be one of the last operations performed.
		- Acl & Access operations should be performed last
		- Managing group policy yields best results in this order:
		  1. Create new GPO
		  2. Create Links, only disabling undesired links
		  3. Delete unneeded GPO
		  4. Delete undesired links
		  This is due to the fact that "unneeded GPO" are detected by being linked into managed GPOs.
	
	.PARAMETER Server
		The server / domain to work with.
	
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.PARAMETER Options
		The various operations that are supported.
		By default "default" operations are executed against the targeted domain.
    	- Acl : The basic permission behavior of an object (e.g.: Owner, Inheritance)
    	- GPLink : Manages the linking of group policies.
    	- GPPermission : Managing permissions on group policy objects.
    	- GroupPolicy : Deploying and updating GPOs.
    	- GroupMembership : Assigning group membership
    	- Group : Creating groups
    	- OUSoft : Creating & modifying OUs, but not deleting them
		- OUHard : Creating, Modifying & Deleting OUs. This exists in order to be able to create
				   new OUs, then move all objects over and only when done deleting undesired OUs.
				   Will NOT delete OUs that contain objects.!
		- PSO : Implementing Finegrained Password Policies
		- Object : Custom AD object
    	- User : Managing User objects
		- GPLinkDisable : Creating GP Links, but only disabling undesired links.
						  This is needed in order to detect undesired GPOs to delete:
						  Those linked when they shouldn't be!
    	- GroupPolicyDelete : Deploy, update and delete Group Policy objects.
	
	.EXAMPLE
		PS C:\> Invoke-AdmfDomain

		Brings the current domain into compliance with the desired state.
	#>
	[CmdletBinding(SupportsShouldProcess = $true)]
	Param (
		[PSFComputer]
		$Server,

		[PSCredential]
		$Credential,

		[UpdateDomainOptions[]]
		$Options = 'Default'
	)
	
	begin
	{
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		try { $dcServer = Resolve-DomainController @parameters }
		catch { throw }
		$parameters.Server = $dcServer
		Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential, WhatIf, Confirm, Verbose, Debug
		$parameters.Server = $dcServer
		[UpdateDomainOptions]$newOptions = $Options
	}
	process
	{
		try
		{
			if ($newOptions -band [UpdateDomainOptions]::OUSoft) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'OrganizationalUnits - Create & Modify', $parameters.Server
				Invoke-DMOrganizationalUnit @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::Group) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Groups', $parameters.Server
				Invoke-DMGroup @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::User) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Users', $parameters.Server
				Invoke-DMUser @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::GroupMembership) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupMembership', $parameters.Server
				Invoke-DMGroupMembership @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::PSO) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'PasswordPolicies', $parameters.Server
				Invoke-DMPasswordPolicy @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::GroupPolicy) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicies - Create & Modify', $parameters.Server
				Invoke-DMGroupPolicy @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::GPPermission) {
				Write-PSFMessage -Level Host -Message "Not implemented yet: <c='em'>Group Policy Permissions</c>"
				# Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicyPermissions', $parameters.Server
				# Invoke-DMGPPermission @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::GPLinkDisable) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicyLinks - Create, Update & Disable unwanted Links', $parameters.Server
				Invoke-DMGPLink @parameters -Disable
			}
			if ($newOptions -band [UpdateDomainOptions]::GroupPolicyDelete) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicies - Delete', $parameters.Server
				Invoke-DMGroupPolicy @parameters -Delete
			}
			if ($newOptions -band [UpdateDomainOptions]::GPLink) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicyLinks - Delete unwanted Links', $parameters.Server
				Invoke-DMGPLink @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::OUHard) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'OrganizationalUnits - Delete', $parameters.Server
				Invoke-DMOrganizationalUnit @parameters -Delete
			}
			if ($newOptions -band [UpdateDomainOptions]::Object) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Objects', $parameters.Server
				Invoke-DMObject @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::Acl) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Acls', $parameters.Server
				Invoke-DMAcl @parameters
			}
			if ($newOptions -band [UpdateDomainOptions]::AccessRule) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'AccessRules', $parameters.Server
				Invoke-DMAccessRule @parameters
			}
		}
		catch { throw }
	}
}