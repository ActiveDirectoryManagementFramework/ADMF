function Reset-DomainControllerCache {
	<#
	.SYNOPSIS
		Resets the cached domain controller resolution.
	
	.DESCRIPTION
		Resets the cached domain controller resolution.
		The targeted domain controller is being cached throughout the execution of a single test or invoke to avoid targeting issues between credential providers and the actual execution.
	
	.EXAMPLE
		PS C:\> Reset-DomainControllerCache

		Resets the cached domain controller resolution.
	#>
	[CmdletBinding()]
	param (

	)

	$script:resolvedDomainController = $null
}