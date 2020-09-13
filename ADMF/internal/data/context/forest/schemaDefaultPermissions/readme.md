# Schema Default Permissions

## Description

The Schema defines how objects in attributes look like.
What attributes do they have?
How do they replicate?
Who is allowed to do what?

Especially of interest from a security perspective:
For object classes, it defines the default permissions applied to a new object of that class.
For example, it defines the permission on any new group policy object that is created.

> The DomainManagement Component `AccessRules` uses these default permissions to avoid forcing you to define every single access rule.

An attacker that modifies the default permissions could gain persistence and trick scanners that automatically exclude default permissions from their analysis.

This Component allows you to define those default permissions, ensuring no unexpected defaults were applied and easily manage intended customizations.

## Default Forest Settings

The default settings in a new forest are already quite massive.
If you want to fully define all permissions, you would need to define every single one of those.

As this would be quite tedious, we have included those in the ADMF-builtin Context template, if you generate it with the `-DefaultAccessRules` parameter.
E.g.:

```powershell
New-AdmfContext -Name ContosoDefault -DefaultAccessRules
```

Custom object classes are not taken into consideration and you need to build that configuration yourself.

## Example Configuration Setting

This setting will add the group "S-GpoAdmins" of the forest root domain to the default permissions for all new group policy objects with full control permissions:

```json
[
    {
        "ClassName":  "Group-Policy-Container",
        "Identity":  "%RootDomainName%\\S-GpoAdmins",
        "ActiveDirectoryRights":  "CreateChild, DeleteChild, Self, WriteProperty, DeleteTree, Delete, GenericRead, WriteDacl, WriteOwner",
        "AccessControlType":  "Allow",
        "InheritanceType":  "All",
        "ObjectType":  "00000000-0000-0000-0000-000000000000",
        "InheritedObjectType":  "00000000-0000-0000-0000-000000000000",
        "Mode":  "Constrained"
    }
]
```

## Parameters

### ClassName

The name of the object class in schema this applies to.

### Identity

The principal to which the access rule applies.
Supports limited string resolution.

### ActiveDirectoryRights

The rights granted.

### AccessControlType

Allow or Deny?
Defaults to: Allow

### InheritanceType

How is this privilege inherited by child objects?

### ObjectType

What object types does this permission apply to?

### InheritedObjectType

What object types does this permission apply to?
Used for extended properties.

### Mode

How access rules are actually applied:

- Additive: Only add new access rules, but do not touch existing ones
- Defined: Add new access rules, remove access rules not defined in configuration that apply to a principal that has access rules defined.
- Constrained: Add new access rules, remove all access rules not defined in configuration

All Modes of all settings for a given class are used when determining the effective Mode applied to that class.
The most restrictive Mode applies.
