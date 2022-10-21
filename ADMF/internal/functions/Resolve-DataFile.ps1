function Resolve-DataFile {
	<#
	.SYNOPSIS
		Resolves the specified file to a datafile path, no matter whether it is json or psd1
	
	.DESCRIPTION
		Resolves the specified file to a datafile path, no matter whether it is json or psd1
		Will prioritize json over psd1 if both are present.
		Will return an empty value if neither exists.
	
	.PARAMETER Path
		Path to the file to resolve.
		Do not specify an extension, if you want to aim for both of them.
	
	.EXAMPLE
		PS C:\> Resolve-DataFile -Path ".\config"

		Will resolve to either ".\config.json" or ".\config.psd1", depending on which is available.
	#>
	[OutputType([string])]
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
		[string]
		$Path
	)

	process {
		if (Test-Path -Path $Path) {
			return $Path
		}
	
		if (Test-Path -Path "$Path.json") {
			return "$Path.json"
		}
	
		if (Test-Path -Path "$Path.psd1") {
			return "$Path.psd1"
		}
	}
}