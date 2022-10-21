function Invoke-AdmfDomain {
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
		PS C:\> Invoke-AdmfDomain

		Brings the current domain into compliance with the desired state.
	#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
	[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
	Param (
		[PSFComputer[]]
		$Server,

		[PSCredential]
		$Credential,

		[ADMF.UpdateDomainOptions[]]
		$Options = 'Default',

		[string]
		$CredentialProvider = 'default',
		
		[Alias('Ctx')]
		[switch]
		$ContextPrompt
	)
	
	begin {
		[ADMF.UpdateDomainOptions]$newOptions = $Options
	}
	process {
		foreach ($computer in $Server) {
			Reset-DomainControllerCache
			$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Credential
			$parameters.Server = $computer
			$originalArgument = Invoke-PreCredentialProvider @parameters -ProviderName $CredentialProvider -Parameter $parameters -Cmdlet $PSCmdlet
			try { $dcServer = Resolve-DomainController @parameters -Confirm:$false }
			catch {
				Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential -Cmdlet $PSCmdlet
				Write-Error $_
				continue
			}
			$parameters.Server = $dcServer
			Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
			Set-AdmfContext @parameters -Interactive -ReUse:$(-not $ContextPrompt) -EnableException
			$parameters += $PSBoundParameters | ConvertTo-PSFHashtable -Include WhatIf, Confirm, Verbose, Debug
			$parameters.Server = $dcServer
			try {
				if ($newOptions -band [UpdateDomainOptions]::OUSoft) {
					if (Get-DMOrganizationalUnit) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'OrganizationalUnits - Create & Modify', $parameters.Server
						Invoke-DMOrganizationalUnit @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'OrganizationalUnits - Create & Modify' }
				}
				if ($newOptions -band [UpdateDomainOptions]::Group) {
					if (Get-DMGroup) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Groups', $parameters.Server
						Invoke-DMGroup @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Groups' }
				}
				if ($newOptions -band [UpdateDomainOptions]::User) {
					if (Get-DMUser) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Users', $parameters.Server
						Invoke-DMUser @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Users' }
				}
				if ($newOptions -band [UpdateDomainOptions]::ServiceAccount) {
					if (Get-DMServiceAccount) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'ServiceAccounts', $parameters.Server
						Invoke-DMServiceAccount @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'ServiceAccounts' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GroupMembership) {
					if (Get-DMGroupMembership) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupMembership', $parameters.Server
						Invoke-DMGroupMembership @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupMembership' }
				}
				if ($newOptions -band [UpdateDomainOptions]::PSO) {
					if (Get-DMPasswordPolicy) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'PasswordPolicies', $parameters.Server
						Invoke-DMPasswordPolicy @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'PasswordPolicies' }
				}
				if ($newOptions -band [UpdateDomainOptions]::WmiFilter) {
					if (Get-DMWmiFilter) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'WmiFilter', $parameters.Server
						Invoke-DMWmiFilter @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'WmiFilter' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GroupPolicy) {
					if (Get-DMGroupPolicy) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicies - Create & Modify', $parameters.Server
						Invoke-DMGroupPolicy @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicies - Create & Modify' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GPPermission) {
					if (Get-DMGPPermission) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicyPermissions', $parameters.Server
						Invoke-DMGPPermission @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicyPermissions' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GPOwner) {
					if (Get-DMGPOwner) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicyOwners', $parameters.Server
						Invoke-DMGPOwner @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicyOwners' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GPLinkDisable) {
					if (Get-DMGPLink) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicyLinks - Create, Update & Disable unwanted Links', $parameters.Server
						Invoke-DMGPLink @parameters -Disable
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicyLinks - Create, Update & Disable unwanted Links' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GroupPolicyDelete) {
					if (Get-DMGroupPolicy) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicies - Delete', $parameters.Server
						Invoke-DMGroupPolicy @parameters -Delete
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicies - Delete' }
				}
				if ($newOptions -band [UpdateDomainOptions]::GPLink) {
					if (Get-DMGPLink) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'GroupPolicyLinks - Delete unwanted Links', $parameters.Server
						Invoke-DMGPLink @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'GroupPolicyLinks - Delete unwanted Links' }
				}
				if ($newOptions -band [UpdateDomainOptions]::OUHard) {
					if (Get-DMOrganizationalUnit) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'OrganizationalUnits - Delete', $parameters.Server
						Invoke-DMOrganizationalUnit @parameters -Delete
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'OrganizationalUnits - Delete' }
				}
				if ($newOptions -band [UpdateDomainOptions]::Object) {
					if (Get-DMObject) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Objects', $parameters.Server
						Invoke-DMObject @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Objects' }
				}
				if ($newOptions -band [UpdateDomainOptions]::Acl) {
					if (Get-DMAcl | Remove-PSFNull) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Acls', $parameters.Server
						Invoke-DMAcl @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Acls' }
				}
				if ($newOptions -band [UpdateDomainOptions]::AccessRule) {
					if (Get-DMAccessRule) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'AccessRules', $parameters.Server
						Invoke-DMAccessRule @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'AccessRules' }
				}
				if ($newOptions -band [UpdateDomainOptions]::DomainLevel) {
					if (Get-DMDomainLevel) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'DomainLevel', $parameters.Server
						Invoke-DMDomainLevel @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'DomainLevel' }
				}
				if ($newOptions -band [UpdateDomainOptions]::Exchange) {
					if (Get-DMExchange) {
						Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Executing.Invoke' -StringValues 'Exchange System Objects', $parameters.Server
						Invoke-DMExchange @parameters
					}
					else { Write-PSFMessage -Level Host -String 'Invoke-AdmfDomain.Skipping.Test.NoConfiguration' -StringValues 'Exchange System Objects' }
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