function Export-AdmfGpo {
	<#
	.SYNOPSIS
		Creates an export of GPO objects for use in the Domain Management module.
	
	.DESCRIPTION
		Creates an export of GPO objects for use in the Domain Management module.
		Use this command to record new GPO data for the module.
	
	.PARAMETER Path
		The path to which to export the GPOs.
	
	.PARAMETER GpoObject
		The GPO objects to export.
		Only accepts output of Get-GPO

	.PARAMETER Domain
		The domain to export from.

	.PARAMETER ExcludeWmiFilter
		Do not export WmiFilter assignments of GPOs
		By default, when exporting GPOs, the associated WMi Filter-Name is also exported

	.PARAMETER OldExportMode
		How should this command deal with the folders of previous GPO backups?
		By default, when detecting the folders of previous GPO backups, this command
		will prompt the user, whether to continue, stop or delete & continue.

		Options:
		+ Interactive (default): Ask the user for a choice, defaulting to keep the folders.
		+ Delete: Previous backup folders will be deleted without prompting
		+ Ignore: Previous backup folders will be kept
	
	.EXAMPLE
		PS C:\> Get-GPO -All | Where-Object DisplayName -like 'AD-D-SEC-T0*' | Export-AdmfGpo -Path .

		Exports all GPOs named like 'AD-D-SEC-T0*' to the current path
	#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSReviewUnusedParameter", "")]
	[CmdletBinding()]
	Param (
		[PsfValidateScript('ADMF.Validate.Path', ErrorString = 'ADMF.Validate.Path')]
		[Parameter(Mandatory = $true)]
		[string]
		$Path,

		[PsfValidateScript('ADMF.Validate.Type.Gpo', ErrorString = 'ADMF.Validate.Type.Gpo')]
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		$GpoObject,

		[string]
		$Domain = $env:USERDNSDOMAIN,

		[switch]
		$ExcludeWmiFilter,

		[ValidateSet('Interactive', 'Delete', 'Ignore')]
		[string]
		$OldExportMode = 'Interactive'
	)
	
	begin {
		$resolvedPath = Resolve-PSFPath -Path $Path -Provider FileSystem -SingleItem

		#region Catch Existing GPO Folders
		$stop = $false
		$gpoFolders = Get-ChildItem -LiteralPath $resolvedPath -Directory | Where-Object Name -Match ([psfrgx]::Guid)
		if ($gpoFolders) {
			$doDelete = $OldExportMode -eq 'Delete'
			if ($OldExportMode -eq 'Interactive') {
				$choice = Get-PSFUserChoice -Caption 'Old GPO Backups Found' -Message "#$(@($gpoFolders).Count) probable GPO Backups have been found in the export path - these could create confusion when trying to add the exported data to the Context, potentially including unneeded folders and their content. What should be done with those folders?" -Options @(
					'Ignore'
					'Delete'
					'Stop'
				)
				if (2 -eq $choice) {
					$stop = $true
					return
				}
				if (1 -eq $choice) { $doDelete = $true }
			}

			if ($doDelete) {
				$gpoFolders | Remove-Item -Recurse -Force
			}
		}
		#endregion Catch Existing GPO Folders

		$backupCmd = { Backup-GPO -Path $resolvedPath -Domain $Domain }
		$backupGPO = $backupCmd.GetSteppablePipeline()
		$backupGPO.Begin($true)

		[System.Collections.ArrayList]$gpoData = @()
		$exportID = [guid]::NewGuid().ToString()
	}
	process {
		if ($stop) { return }

		foreach ($gpoItem in $GpoObject) {
			$exportData = $backupGPO.Process(($gpoItem | Select-PSFObject 'ID as GUID'))
			$data = @{
				DisplayName = $gpoItem.DisplayName
				Description = $gpoItem.Description
				ID          = "{$($exportData.ID.ToString().ToUpper())}"
				ExportID    = $exportID
			}
			if (-not $ExcludeWmiFilter -and $gpoItem.WmiFilter.Name) {
				$data.WmiFilter = $gpoItem.WmiFilter.Name
			}
			$null = $gpoData.Add([PSCustomObject]$data)
		}
	}
	end {
		if ($stop) { return }

		$backupGPO.End()
		$gpoData | ConvertTo-Json | Set-Content "$resolvedPath\exportData.json"

		# Remove hidden attribute, to prevent issues with copy over WinRM
		foreach ($fsItem in (Get-ChildItem -Path $resolvedPath -Recurse -Force)) {
			$fsItem.Attributes = $fsItem.Attributes -band [System.IO.FileAttributes]::Directory
		}
	}
}
