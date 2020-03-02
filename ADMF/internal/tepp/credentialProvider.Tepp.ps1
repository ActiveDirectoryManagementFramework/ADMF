Register-PSFTeppScriptblock -Name 'ADMF.CredentialProvider' -ScriptBlock {
    $module = Get-Module ADMF
    if (-not $module) { return }
    & $module { $script:credentialProviders.Keys }
}
Register-PSFTeppArgumentCompleter -Command Test-AdmfDomain -Parameter CredentialProvider -Name 'ADMF.CredentialProvider'
Register-PSFTeppArgumentCompleter -Command Invoke-AdmfDomain -Parameter CredentialProvider -Name 'ADMF.CredentialProvider'
Register-PSFTeppArgumentCompleter -Command Test-AdmfForest -Parameter CredentialProvider -Name 'ADMF.CredentialProvider'
Register-PSFTeppArgumentCompleter -Command Invoke-AdmfForest -Parameter CredentialProvider -Name 'ADMF.CredentialProvider'