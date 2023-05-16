function Resolve-GetParameter {
	[OutputType([hashtable])]
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Command,

		[Parameter(Mandatory = $true)]
		$Values,

		[bool]
		$GetV3
	)

	process {
		switch ($Command) {
			#region Save Module
			'Save-Module' {
				#region V3
				if ($GetV3) {

				}
				#endregion V3

				#region V2
				else {
					$parameters = @((Get-Command Save-Module).Parameters.Keys | Write-Output) + @('ModuleName', 'ModuleVersion')
					$hashtables = $Values | ConvertTo-PSFHashtable -Include $parameters -Remap @{
						ModuleName = 'Name'
						ModuleVersion = 'MinimumVersion'
					}
					$result = @{}
					foreach ($hashtable in $hashtables) { $result += $hashtable }
					$result
				}
				#endregion V3
			}
			#endregion Save Module
			default {
				throw "Command not supported: $Command"
			}
		}
	}
}