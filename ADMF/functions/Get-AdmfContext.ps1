function Get-AdmfContext
{
<#
	.SYNOPSIS
		Return available contexts.
	
	.DESCRIPTION
		Return available contexts.
		By default, only the latest version of any given context will be returned.
	
	.PARAMETER Name
		The name of the context to filter by.
	
	.PARAMETER Store
		The context stores to look in.
	
	.PARAMETER All
		Return all versions of any given context, rather than just the latest version.

	.PARAMETER Current
		Displays the currently active contexts.

	.PARAMETER Importing
		Return the contexts that are currently being imported.
		Use this to react from within your context's scriptblocks to any other context that is selected.
		This parameter only has meaning when used within a context's scriptblocks.
	
	.PARAMETER DomainTable
		Return a list of which target domain has which contexts assigned in cache.
	
	.EXAMPLE
		PS C:\> Get-AdmfContext
	
		Returns the latest version of all available contexts.
#>
	[CmdletBinding(DefaultParameterSetName = 'Search')]
	param (
		[Parameter(ParameterSetName = 'Search')]
		[string]
		$Name = '*',
		
		[Parameter(ParameterSetName = 'Search')]
		[string]
		$Store = '*',
		
		[Parameter(ParameterSetName = 'Search')]
		[switch]
		$All,
		
		[Parameter(ParameterSetName = 'Current')]
		[switch]
		$Current,

		[Parameter(ParameterSetName = 'Importing')]
		[switch]
		$Importing,
		
		[Parameter(ParameterSetName = 'Server')]
		[switch]
		$DomainTable
	)
	
	process
	{
		if ($Current)
		{
			return $script:loadedContexts
		}
		if ($DomainTable)
		{
			return $script:assignedContexts.Clone()
		}
		if ($Importing)
		{
			return (Get-PSFTaskEngineCache -Module ADMF -Name currentlyImportingContexts)
		}
		$contextStores = Get-AdmfContextStore -Name $Store
		$allContextData = foreach ($contextStore in $contextStores)
		{
			if (-not (Test-Path $contextStore.Path)) { continue }
			foreach ($folder in (Get-ChildItem -Path $contextStore.Path -Filter $Name -Directory))
			{
				$versionFolders = Get-ChildItem -Path $folder.FullName -Directory | Where-Object { $_.Name -as [version] } | Sort-Object { [version]$_.Name } -Descending
				if (-not $All) { $versionFolders = $versionFolders | Select-Object -First 1 }
				
				foreach ($versionFolder in $versionFolders)
				{
					$resultObject = [pscustomobject]@{
						PSTypeName = 'ADMF.Context'
						Name	   = $folder.Name
						Version    = ($versionFolder.Name -as [version])
						Store	   = $contextStore.Name
						Path	   = $versionFolder.FullName
						Description = ''
						Weight	   = 50
						Author	   = ''
						Prerequisites = @()
						MutuallyExclusive = @()
						Group	   = 'Default'
					}
					if (Test-Path -Path "$($versionFolder.FullName)\context.json")
					{
						$contextData = Get-Content -Path "$($versionFolder.FullName)\context.json" | ConvertFrom-Json
						if ($contextData.Weight -as [int]) { $resultObject.Weight = $contextData.Weight -as [int] }
						if ($contextData.Description) { $resultObject.Description = $contextData.Description }
						if ($contextData.Author) { $resultObject.Author = $contextData.Author }
						if ($contextData.Prerequisites) { $resultObject.Prerequisites = $contextData.Prerequisites }
						if ($contextData.MutuallyExclusive) { $resultObject.MutuallyExclusive = $contextData.MutuallyExclusive }
						if ($contextData.Group) { $resultObject.Group = $contextData.Group }
					}
					
					$resultObject
				}
			}
		}
		
		if ($All) { return $allContextData }
		
		# Only return highest version if -All has not been set
		# The same context name might be stored in multiple stores
		$allContextData | Group-Object Name | ForEach-Object {
			$_.Group | Sort-Object Version -Descending | Select-Object -First 1 | Select-PSFObject -TypeName 'ADMF.Context'
		}
	}
}