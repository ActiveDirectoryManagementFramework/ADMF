# Changelog

## ???

- Upd: New-AdmfContext - support for Domain Data and Group Policy Registry Settings added
- Upd: Set-AdmfContext - support for Domain Data and Group Policy Registry Settings added
- Upd: Set-AdmfContext - support for NTAuthStore added
- Upd: Test-AdmfForest - added step to test NTAuthStore Component
- Upd: Invoke-AdmfForest - added step to update NTAuthStore Component
- Upd: Added warning message on screen when credential provider cannot be resolved
- Upd: Default Permission sets - adding access rules for domain root
- Fix: Set-AdmfContext - Importing Object Category would import a nested scriptblock that is always $true

## 1.1.14 (2020-03-02)

- New: Component to customize credentials used. The Credential Providers allow dynamic credential resolution (e.g.: Accessing Key Vaults) as part of all ADMF workflows.
- New: Register-AdmfCredentialProvider - register logic to resolve credentials to use
- Upd: Invoke-AdmfDomain - support for applying Group Policy Permission configuration added
- Upd: Test-AdmfDomain - support for testing Group Policy Permissions added
- Upd: Set-AdmfContext - support for Group Policy Permissions and Group Policy Permission Filters added
- Upd: New-AdmfContext - support for Group Policy Permissions and Group Policy Permission Filters added
- Upd: New-AdmfContext - the `-DefaultAccessRules` parameter now also creates default Group Policy Permissions
- Fix: Context scriptblocks for determining, whether they should be checked in interactive selection mode would not receive explicit credentials.

## 1.0.6 (2020-02-24)

- Upd: Get-AdmfContext - New parameter `-Importing` for use within a context's scriptblock.
- Fix: Set-AdmfContext - No longer re-prompts for context when switching to a new domain with same contexts as previous one.
- Fix: Set-AdmfContext - Acls from context would not be applied.
- Fix: All Invoke-* and Test-* commands will now properly prompt for context if needed.
- Fix: Group Policy Object configuration from contexts is stored with wrong path.
- Fix: Export-AdmfGpo - removes hidden attribute from all exported files. This attribute prevented application of GPOs, as copy via WinRM will not transfer hidden files.

## 1.0.0 (2019-12-21)

- Initial Upload
