function New-AdmfContextStore
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[PsfValidateScript('ADMF.Validate.ContextStore.ExistsNot', ErrorString = 'ADMF.Validate.ContextStore.ExistsNot')]
		[PsfValidatePattern('^[\w\d_\-\.]+$', ErrorString = 'ADMF.Validate.Pattern.ContextStoreName')]
		[string]
		$Name,
		
		[PsfValidateScript('ADMF.Validate.Path.Folder', ErrorString = 'ADMF.Validate.Path.Folder')]
		[string]
		$Path,
		
		[PSFramework.Configuration.ConfigScope]
		$Scope = "UserDefault",
		
		[switch]
		$EnableException
	)
	
	process
	{
		$resolvedPath = Resolve-PSFPath -Path $Path -Provider FileSystem -SingleItem
		Set-PSFConfig -FullName "ADMF.Context.Store.$Name" -Value $Path
		Register-PSFConfig -FullName "ADMF.Context.Store.$Name" -Scope $Scope -EnableException:$EnableException
	}
}