<#
Stored scriptblocks are available in [PsfValidateScript()] attributes.
This makes it easier to centrally provide the same scriptblock multiple times,
without having to maintain it in separate locations.

It also prevents lengthy validation scriptblocks from making your parameter block
hard to read.

Set-PSFScriptblock -Name 'ADMF.ScriptBlockName' -Scriptblock {
	
}
#>
Set-PSFScriptblock -Name 'ADMF.Validate.Type.Gpo' -Scriptblock {
    foreach ($item in $_) {
        if ($item.PSObject.TypeNames -notcontains 'Microsoft.GroupPolicy.Gpo') { return $false }
    }
    $true
}
Set-PSFScriptblock -Name 'ADMF.Validate.Path' -Scriptblock {
	Test-Path -Path $_
}
Set-PSFScriptblock -Name 'ADMF.Validate.Path.Folder' -Scriptblock {
	$resolvedPath = Resolve-PSFPath -Provider FileSystem -Path $_ -SingleItem
	Test-Path -Path $resolvedPath -PathType Container
}
Set-PSFScriptblock -Name 'ADMF.Validate.ContextStore.ExistsNot' -Scriptblock {
	$_ -notin (Get-AdmfContextStore).Name
}