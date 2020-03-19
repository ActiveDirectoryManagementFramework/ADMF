# Group Policy Registry Setting

## Synopsis

The Group Policy Component allows defining Group Policy objects.
However, it can only take a GPO backup and apply it.

At this time, it is not possible to fully define a GPO using this solution.
However, with this GP Registry Setting Component, we can now enable you to define custom registry settings (as if applied using Set-GPRegistryValue, which is indeed the cmdlet used behind the scenes).

## Description

> Applying these settings independent of the Group Policy Component would conflict with its change tracking capabilities. Thus the two are processed in a single step, and _it is impossible to define registry settings for grooup policy objects not defined in configuration_ !

Most properties/parameters defining these registry settings support the Name and the Domain Data Components, allowing you to dynamically insert values into most stages of the process.

To define any settings, place any arbitrary number of json files in this folder, each containing one or more registry setting definitions.

## Examples

There are two basic scenarios:

+ Assign a straight value
+ Assign a value received from Domain Data (without any string coercion of name replacements)

> Example 1

```json
{
	"PolicyName":  "C-S-CA-EnrollmentPolicy",
	"Key":  "HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Cryptography\\PolicyServers\\37c9dc30f207f27f61a2f7c3aed598a6e2920b54",
	"ValueName":  "AuthFlags",
	"Type":  "DWord",
	"Value":  2
}
```

In this example, it will take the straight value of 2 and apply it to the specified key/name.

> Example 2

```json
{
	"PolicyName":  "C-S-CA-EnrollmentPolicy",
	"Key":  "HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Cryptography\\PolicyServers",
	"ValueName":  "(Default)",
	"Type":  "String",
	"DomainData":  "PolicyID"
}
```

In this example, it will set the default value of the specified key to the data that was returned by the Domain Data Component's "PolicyID" script.
For more details on defining Domain Data Component resources, see the relevant readme or website.

## Properties

### PolicyName

The name of the group policy to apply the setting to.

> Subject to advanced string insertion.

### Key

The registry key, which to create if needed to appley the name/value pair.

> Subject to advanced string insertion.

### ValueName

The name of the value to define in registry.

> Subject to advanced string insertion.

### Type

The type of data written to registry.

Legal values: 'Binary', 'DWord', 'ExpandString', 'MultiString', 'QWord', 'String'

### Value

The straight value to write to registry.

> Mutually exclusive with DomainData

### DomainData

Rather than providing a straight value, specify the name of a script defined in the Domain Data component.
The return value of that script will be written to registry.

> Mutually exclusive with Value
