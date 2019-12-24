function Test-AdmfForest
{
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
		
		.EXAMPLE
			PS C:\> Test-AdmfForest

			Test the current forest for baseline compliance.
	#>
	
	[CmdletBinding()]
	Param (
		[PSFComputer]
		$Server,

		[PSCredential]
		$Credential,

		[UpdateForestOptions[]]
		$Options = 'All'
	)
	
	begin
	{
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		try { $parameters.Server = Resolve-DomainController @parameters -ErrorAction Stop }
		catch { throw }
		Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
		[UpdateForestOptions]$newOptions = $Options
	}
	process
	{
		try
		{
			if ($newOptions -band [UpdateForestOptions]::Sites) {
				Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Sites', $parameters.Server
				Test-FMSite @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::SiteLinks) {
				Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Sitelinks', $parameters.Server
				Test-FMSiteLink @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::Subnets) {
				Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Subnets', $parameters.Server
				Test-FMSubnet @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::ServerRelocate) {
				Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Server Site Assignment', $parameters.Server
				Test-FMServer @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::Schema) {
				Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Schema (Custom)', $parameters.Server
				Test-FMSchema @parameters
			}
			if ($newOptions -band [UpdateForestOptions]::SchemaLdif) {
				Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Schema (Ldif)', $parameters.Server
				Test-FMSchemaLdif @parameters
			}
		}
		catch { throw }
	}
}
