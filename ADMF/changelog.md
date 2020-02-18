# Changelog

## 1.0.6 (2020-02-18)

- Upd: Get-AdmfContext - New parameter `-Importing` for use within a context's scriptblock.
- Fix: Set-AdmfContext - No longer re-prompts for context when switching to a new domain with same contexts as previous one.
- Fix: Set-AdmfContext - Acls from context would not be applied.
- Fix: All Invoke-* and Test-* commands will now properly prompt for context if needed.
- Fix: Group Policy Object configuration from contexts is stored with wrong path.
- Fix: Export-AdmfGpo - removes hidden attribute from all exported files. This attribute prevented application of GPOs, as copy via WinRM will not transfer hidden files.

## 1.0.0 (2019-12-21)

- Initial Upload
