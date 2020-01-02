function Get-AdmfContextStore
{
<#
	.SYNOPSIS
		Returns the list of available context stores.
	
	.DESCRIPTION
		Returns the list of available context stores.
	
	.PARAMETER Name
		The name to filter by.
	
	.EXAMPLE
		PS C:\> Get-AdmfContextStore
	
		Returns all available context stores.
#>
	[CmdletBinding()]
	param (
		[string]
		$Name = '*'
	)
	
	process
	{
		foreach ($config in (Get-PSFConfig -FullName "ADMF.Context.Store.$Name"))
		{
			[PSCustomObject]@{
				PSTypeName = 'ADMF.Context.Store'
				Name	   = $config.Name -replace '^Context\.Store\.'
				Path	   = $config.Value
				PathExists = (Test-Path $config.Value)
			}
		}
	}
}