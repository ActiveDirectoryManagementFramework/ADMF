# Changelog

## ???

- New: Component - "Group Policy Ownership"
- Upd: Context (default permissions) - Removed default permission for adminSDHolder to "S-1-5-0" to change the password

## 1.9.66 (2021-07-13)

- Upd: Updated dependency version to install/update to latest versions of DCManagement and DomainManagement

## 1.9.65 (2021-05-18)

- Upd: Set-AdmfContext - added `-DnsDomain` parameter, disabling domain lookup & accelerating Context pre-assignment.
- Upd: DC Resolution - added 'Site' option to the `ADMF.DCSelectionMode` configuration setting. Allows picking the sites in which we look for DCs first.

## 1.9.62 (2021-04-23)

- Upd: Invoke-AdmfDC - added `-TargetServer` parameter to allow processing specific servers only
- Upd: Test-AdmfDC - added `-TargetServer` parameter to allow processing specific servers only
- Upd: Contexts now process the `servers` node
- Upd: Newly created Contexts with default access rules now also contain the default assignments to the AdminSDHolder object.

## 1.9.58 (2021-03-04)

- New: Component - Exchange System Objects (at the domain level)
- Upd: DC Resolution - Added new option to select DC by site, rather than just PDC or random.
- Upd: Added caching to domain controller resolution so that credential providers may use the same resolution results.

## 1.8.55 (2021-01-15)

- New: Component - Service Accounts
- Fix: Test-AdmfDomain - Generates error when executing with Acl included but none defined
- Fix: Invoke-AdmfDomain - Generates error when executing with Acl included but none defined

## 1.7.52 (2020-10-21)

- New: Component - Certificates
- Upd: Set-AdmfContext - removed -IncludeTemplate parameter, as unpractical to maintain.
- Fix: Label processing error for non-domain Context prompts fails (e.g. in scenarios where you deploy new domains)

## 1.6.49 (2020-09-11)

- New: Component - Domain Level
- New: Component - Forest Level
- New: Component - ExchangeSchema
- New: Component - SchemaDefaultPermissions
- Upd: Set-AdmfContext - changed UI form title to always show domain name
- Upd: Set-AdmfContext - added `-DefineOnly` parameter to only map domain to Contexts selected, making it easier to bulk-define associations.
- Upd: Invoke-AdmfDC - added `-ContextPrompt` parameter to force displaying the Context selection menu.
- Upd: Invoke-AdmfDomain - added `-ContextPrompt` parameter to force displaying the Context selection menu.
- Upd: Invoke-AdmfForest - added `-ContextPrompt` parameter to force displaying the Context selection menu.
- Upd: Test-AdmfDC - added `-ContextPrompt` parameter to force displaying the Context selection menu.
- Upd: Test-AdmfDomain - added `-ContextPrompt` parameter to force displaying the Context selection menu.
- Upd: Test-AdmfForest - added `-ContextPrompt` parameter to force displaying the Context selection menu.
- Upd: Opted into the 'PSFramework.Stop-PSFFunction.ShowWarning' feature, ensuring warnings will ALWAYS be written on context selection failure

## 1.2.36 (2020-07-31)

- New: Invoke-AdmfDC - new command to apply DC configuration entries on DCs
- New: Test-AdmfDC - new command to test DC configuration entries
- Upd: Invoke-AdmfDomain - added confirm-impact high
- Upd: Invoke-AdmfForest - added confirm-impact high
- Upd: Get-AdmfContext - added -DomainTable switch parameter to get a list of which server/domain has what Contexts assigned.
- Upd: Set-AdmfContext - storing Context selection per domain, not per server.
- Upd: Configuration - added setting 'ADMF.DCInstall.Context.Prompt.Enable' to allow disabling Context prompts for Install commands in DCManagement
- Upd: Set-AdmfContext - add support for file system accesss rules Component
- Fix: Invoke-Admf*, Test-Admf* - will no longer prompt for confirmation when resolving domain controller to use.

## 1.1.27 (2020-06-21)

- Upd: Set-AdmfContext - added Component: DC > Shares
- Upd: New-AdmfContext - added folder and readme for adding DC Shares to the Context

## 1.1.25 (2020-06-04)

- Upd: Set-AdmfContext - added Context name insertion for forest Components that support it.
- Fix: Fails to resolve a domain controller using a credential provider due to timing issues.

## 1.1.23 (2020-04-17)

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
