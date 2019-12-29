@{
	# Script module or binary module file associated with this manifest
	RootModule = 'ADMF.psm1'
	
	# Version number of this module.
	ModuleVersion = '1.0.0'
	
	# ID used to uniquely identify this module
	GUID = '43f2a890-942f-4dd7-bad0-b774b44ea849'
	
	# Author of this module
	Author = 'Friedrich Weinmann'
	
	# Company or vendor of this module
	CompanyName = 'Microsoft'
	
	# Copyright statement for this module
	Copyright = 'Copyright (c) 2019 Friedrich Weinmann'
	
	# Description of the functionality provided by this module
	Description = 'Central Management Component of the Active Directory Management Framework'
	
	# Minimum version of the Windows PowerShell engine required by this module
	PowerShellVersion = '5.0'
	
	# Modules that must be imported into the global environment prior to importing
	# this module
	RequiredModules = @(
		@{ ModuleName = 'PSFramework'; ModuleVersion = '1.1.59' }
		@{ ModuleName = 'DCManagement'; ModuleVersion = '1.0.4' }
		@{ ModuleName = 'DomainManagement'; ModuleVersion = '1.0.11' }
		@{ ModuleName = 'ForestManagement'; ModuleVersion = '1.0.5' }
	)
	
	# Assemblies that must be loaded prior to importing this module
	RequiredAssemblies = @('bin\ADMF.dll')
	
	# Type files (.ps1xml) to be loaded when importing this module
	# TypesToProcess = @('xml\ADMF.Types.ps1xml')
	
	# Format files (.ps1xml) to be loaded when importing this module
	FormatsToProcess = @('xml\ADMF.Format.ps1xml')
	
	# Functions to export from this module
	FunctionsToExport  = @(
		'Export-AdmfGpo'
		'Get-AdmfContext'
		'Get-AdmfContextStore'
		'Invoke-AdmfDomain'
		'Invoke-AdmfForest'
		'New-AdmfContext'
		'New-AdmfContextStore'
		'Test-AdmfDomain'
		'Test-AdmfForest'
	)
	
	# Cmdlets to export from this module
	CmdletsToExport = ''
	
	# Variables to export from this module
	VariablesToExport = ''
	
	# Aliases to export from this module
	AliasesToExport = ''
	
	# List of all modules packaged with this module
	ModuleList = @()
	
	# List of all files packaged with this module
	FileList = @()
	
	# Private data to pass to the module specified in ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
	PrivateData = @{
		
		#Support for PowerShellGet galleries.
		PSData = @{
			
			# Tags applied to this module. These help with module discovery in online galleries.
			# Tags = @()
			
			# A URL to the license for this module.
			# LicenseUri = ''
			
			# A URL to the main website for this project.
			# ProjectUri = ''
			
			# A URL to an icon representing this module.
			# IconUri = ''
			
			# ReleaseNotes of this module
			# ReleaseNotes = ''
			
		} # End of PSData hashtable
		
	} # End of PrivateData hashtable
}