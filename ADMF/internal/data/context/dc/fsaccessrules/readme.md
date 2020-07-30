# File System Access Rules

## Description

This Component allows defining the Access Rules on file system paths on DomainControllers.

By default, defining any explicit access rule will cause all non-defined Access Rules to be removed.
To change this behavior, use the `AccessMode` parameter.

Inherited rights will always be ignored, and no other folder will be inspected for permissions.

## Example Configuration

Create two access rules:

+ C:\Scripts_old should have no explicit permissions
+ C:\Scripts should have the domain's administrator account with FullControl permissions

```json
[
    {
        "Path":  "C:\\Scripts_old",
        "Empty":  true
    },
    {
        "Path":  "C:\\Scripts",
        "Identity":  "%DomainName%\\Administrator",
        "Rights":  "FullControl"
    }
]
```

Create a rule, granting modify access to all child items but not the folder itself to the Domain Admins.
Existing permissions to the Domain Admins are replaced by this new permission.

```json
[
    {
        "Path":  "C:\\Scripts",
        "Identity":  "%DomainSID%-512",
        "Rights":  "Modify",
		"Propagation":  "InheritOnly",
		"AccessMode":  "Defined"
    }
]
```

## Tools

This snippet will parse the non-inherited access rules from the targeted folder:

```powershell
Get-Acl C:\Temp |
  Select-Object -ExpandProperty Access |
    Where-Object IsInherited -eq $false |
      Select-PSFObject @(
        @{Name="Path";Expression={'C:\Temp'}}
        'FileSystemRights as Rights to String'
        'AccessControlType as Type to String'
        @{Name="Identity";Expression={$_.IdentityReference.ToString() -replace '^contoso','%DomainNetBIOSName%'}}
        'InheritanceFlags as Inheritance to String'
        'PropagationFlags as Propagation to String'
      ) | ConvertTo-Json
```

> Note: Replace the two instances of the path and the domainname (In this example: contoso) to match your needs.

## Parameters

### Path

The path to the filesystem object to grant permissions on.

> Supports string resolution.

### Identity

What identity / principal to grant access.

> Supports string resolution.

### Rights

What file system right to grant.
Typical rights include FullControl, Read, ReadWrite, Modify.

For a full list of rights, see: https://docs.microsoft.com/en-us/dotnet/api/system.security.accesscontrol.filesystemrights

### Type

Whether this is an allow or a deny rule.
Defaults to Allow.

### Inheritance

Who and how are access rules inherited.
Defaults to 'ContainerInherit, ObjectInherit', meaning everything beneath the path inherits as well.

Options:

None | None of the children inherits the ACE
ContainerInherit | Only subfolders inherit the ACE
ObjectInherit | Only child items that are files inherit the ACE

> Each option can be combined with each other

### Propagation

How access rules are being propagated.
Defaults to "None", the windows default behavior.

Options:

InheritOnly | Permissions only apply to items under this folder, not the folder itself.
NoPropagateInherit | Permissions only apply to this folder but none of its child items.
None | Permissions apply to this folder and all children.

### Empty

This path should have no explicit ACE defined.

### AccessMode

How filesystem access rules are processed.
Supports three configurations:

Constrained | The default access mode, will remove any excess access rules.
Additive | Ignore any access rules already on the path, even if not configured
Defined | Ignore any access rules already on the path, even if not configured UNLESS the identity on those rules has an access level defined for it.

### ServerRole

What domain controller to apply this to:

All | All DCs in the enterprise
FSMO | Only DCs that have any FSMO role
PDC | Only the PDCEmulator
