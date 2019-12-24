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
        if (-not ($item -is [Microsoft.GroupPolicy.Gpo])) { return $false }
    }
    $true
}
Set-PSFScriptblock -Name 'ADMF.Validate.Path' -Scriptblock {
    Test-Path -Path $_
}