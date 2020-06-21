# Shares

## Description

Domain controllers might occasionally need extra network shares for some workflows.
If that is the case however, it becomes especially important to consider the security aspects of it.
This is where this Component comes in, as it allows you to:

- Define network shares
- Define network share permissions

## Example Configuration

A simple share could look like this:

```json
{
    "Name":  "Scripts$",
    "Path":  "C:\\Scripts",
    "Description":  "Backup location for all Tier 0 admin code. Signed code only.",
    "FullAccess":  [ "%DomainName%\\Domain Admins" ],
    "WriteAccess":  [ "%DomainName%\\Tier 0 Admins" ],
    "ReadAccess":  [ "%DomainName%\\Tier 0 Operators" ]
}
```

## Parameters

### Name

The name of the share.

> Supports string resolution.

### Path

The path the share points to.

> Supports string resolution.

### Description

The description of the share.

> Supports string resolution.

### FullAccess

The principals to grant full access to.

> Supports string resolution.

### WriteAccess

The principals to grant write access to.

> Supports string resolution.

### ReadAccess

The principals to grant read access to.

> Supports string resolution.

### AccessMode

How share access rules are processed.
Supports three configurations:

- Constrained: The default access mode, will remove any excess access rules.
- Additive: Ignore any access rules already on the share, even if not configured
- Defined: Ignore any access rules already on the share, even if not configured UNLESS the identity on those rules has an access level defined for it.

### ServerRole

What domain controller to apply this to:

- All:  All DCs in the enterprise
- FSMO: Only DCs that have any FSMO role
- PDC:  Only the PDCEmulator
