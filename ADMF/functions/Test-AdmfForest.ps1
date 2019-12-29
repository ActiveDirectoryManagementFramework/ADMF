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

		[ADMF.UpdateForestOptions[]]
		$Options = 'All'
	)
	
	begin
	{
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		try { $parameters.Server = Resolve-DomainController @parameters -ErrorAction Stop }
		catch { throw }
		Invoke-PSFCallback -Data $parameters -EnableException $true -PSCmdlet $PSCmdlet
		[ADMF.UpdateForestOptions]$newOptions = $Options
	}
	process
	{
		try
		{
			if ($newOptions -band [UpdateForestOptions]::Sites) {
				if (Get-FMSite)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Sites', $parameters.Server
					Test-FMSite @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Sites' }
			}
			if ($newOptions -band [UpdateForestOptions]::SiteLinks) {
				if (Get-FMSiteLink)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Sitelinks', $parameters.Server
					Test-FMSiteLink @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Sitelinks' }
			}
			if ($newOptions -band [UpdateForestOptions]::Subnets) {
				if (Get-FMSubnet)
				{
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
			if ($newOptions -band [UpdateForestOptions]::Schema) {
				if (Get-FMSchema)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Schema (Custom)', $parameters.Server
					Test-FMSchema @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Schema (Custom)' }
			}
			if ($newOptions -band [UpdateForestOptions]::SchemaLdif) {
				if (Get-FMSchemaLdif)
				{
					Write-PSFMessage -Level Host -String 'Test-AdmfForest.Executing.Test' -StringValues 'Schema (Ldif)', $parameters.Server
					Test-FMSchemaLdif @parameters
				}
				else { Write-PSFMessage -Level Host -String 'Test-AdmfForest.Skipping.Test.NoConfiguration' -StringValues 'Schema (Ldif)' }
			}
		}
		catch { throw }
	}
}
