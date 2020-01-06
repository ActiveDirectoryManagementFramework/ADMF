function New-AdmfContextStore
{
<#
	.SYNOPSIS
		Creates a new Context Store.
	
	.DESCRIPTION
		Creates a new Context Store.
		Context Stores are locations where configuration contexts are stored and retrieved from.
	
		These contexts are stored using the PSFramework configuration system:
		https://psframework.org/documentation/documents/psframework/configuration.html
		Making it possible to deploy them using GPO, SCCM or other computer or profile management solutions.
	
	.PARAMETER Name
		The name of the store to create.
		Must not exist yet.
	
	.PARAMETER Path
		The path where the context is pointing at.
		Must be an existing folder.
	
	.PARAMETER Scope
		Where to persist the store.
		by default, this is stored in HKCU, making the store persistently available to the user.
		For more information on scopes, and what location they corespond with, see:
		https://psframework.org/documentation/documents/psframework/configuration/persistence-location.html
	
	.PARAMETER EnableException
		This parameters disables user-friendly warnings and enables the throwing of exceptions.
		This is less user friendly, but allows catching exceptions in calling scripts.
	
	.EXAMPLE
		PS C:\> New-AdmfContextStore -Name 'company' -Path '\\contoso\system\ad\contexts'
	
		Creates a new context named 'company', pointing at '\\contoso\system\ad\contexts'
#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[PsfValidateScript('ADMF.Validate.ContextStore.ExistsNot', ErrorString = 'ADMF.Validate.ContextStore.ExistsNot')]
		[PsfValidatePattern('^[\w\d_\-\.]+$', ErrorString = 'ADMF.Validate.Pattern.ContextStoreName')]
		[string]
		$Name,
		
		[Parameter(Mandatory = $true)]
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
		Set-PSFConfig -FullName "ADMF.Context.Store.$Name" -Value $resolvedPath
		Register-PSFConfig -FullName "ADMF.Context.Store.$Name" -Scope $Scope -EnableException:$EnableException
	}
}