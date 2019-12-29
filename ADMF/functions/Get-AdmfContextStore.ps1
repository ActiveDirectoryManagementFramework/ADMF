function Get-AdmfContextStore
{
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