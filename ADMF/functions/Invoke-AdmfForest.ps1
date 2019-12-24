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
	
	.EXAMPLE
		PS C:\> Invoke-AdmfForest -Server contoso.com -Options All

		Applies the full forest configuration to the contoso.com domain.
	#>
	[CmdletBinding(SupportsShouldProcess = $true)]
	Param (
		[PSFComputer]
		$Server,

		[PSCredential]
		$Credential,

		[UpdateForestOptions[]]
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
		[UpdateForestOptions]$newOptions = $Options
	}
	process
	{
		try
		{
			if ($newOptions -band [UpdateForestOptions]::Sites) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Sites', $parameters.Server
				Invoke-FMSite @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::SiteLinks) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Sitelinks', $parameters.Server
				Invoke-FMSiteLink @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::Subnets) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Subnets', $parameters.Server
				Invoke-FMSubnet @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::ServerRelocate) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Server Site Assignment', $parameters.Server
				Invoke-FMServer @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::Schema) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Schema (Custom)', $parameters.Server
				Invoke-FMSchema @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::SchemaLdif) {
				Write-PSFMessage -Level Host -String 'Invoke-AdmfForest.Executing.Invoke' -StringValues 'Schema (Ldif)', $parameters.Server
				Invoke-FMSchemaLdif @parameters
			}
		}
		catch { throw }
	}
}
