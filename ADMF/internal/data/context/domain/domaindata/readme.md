# Domain Data

## Synopsis

The Context system is by itself not domain specific.
That is, applying the same Context to different domains should bring the same results.

It can automatically adjust for aspects such as domain name or distinguished names, but beyond that, it is not affected by the domain.
This means that switching targeted domain will not reload the Context, if the next domain has the same context!

However, sometimes we may want to be able to execute custom logic against a specific domain.
Instead of requiring a custom per-domain Context, the Domain Data system allows providing data using custom script logic that is executed on-invocation against the targeted domain.
The resulting data can then be further used in other Components.
Support for that is still rare, but will be made available to a larger scale of Components as time permits.

Currently implementing Components:

+ Group Policy Registry Settings

## Defining Domain Data

To define domain data, provide any number of `psd1` files in this folder (NOT `json`!).
Each psd1 file needs to contain one or more hashtables with two keys:

+ Name
+ Scriptblock

Example:

```powershell
@{
	Name = 'DomainGUID'
	Scriptblock = {
		param (
			$Parameters
		)
		(Get-ADDomain @parameters).ObjectGUID
	}
}
```

## Properties

### Name

The name can be any string, so long as it contains only letters, numbers or underscores.
The name is _not_ case sensitive!

### Scriptblock

The Scriptblock is a PowerShell scriptblock, receiving a single parameter - a hashtable containing the target domain (`Server` ; or domain controller) and - if specified - credentials to use ( `Credential`).

It should then proceed to gather data, do whatever it is intended to do, and finally return the result.
If the script throws an exception, the ADMF is going to assume the worst and refuse to process the corresponding Component, lest it apply an inconsistent, erroneous state.
