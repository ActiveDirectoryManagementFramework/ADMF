# Group Policy Permissions

## Synopsis

Define permissions that should apply to group policy objects.

Drop any number of json files in this folder.
Each json file can contain one or several configuration items.
Each configuration setting must map to the parameters of Register-DMGPPermission in one valid parameterset.
Different items in the same file need not all be of the same parameterset.

> Note on filters

Filters can be a filter string that would be legal powershell, however they can contain only a few items:

+ Parenthesis
+ Logical operators (-and, -or, -xor, -not)
+ Filter names (either as if they were a command or a an argument)

They must be syntactically correct as far as PowerShell is concerned.

For example, these would be all be legal filters:

+ `IsManaged -and Tier0`
+ `-not (IsManaged) -or (Tier1 -and UserScope)`

All filters must be defined when testing GP Permissions.
To define a filter, see the `gppermissionfilters` Component.

Were a filter string accepted where a filter condition has not been defined, we could not be sure the permissions were correctly resolved, which might lead to critical security configuration errors.
Due to this any configuration error will lead to terminating the test and not providing any actions!

Group Policy Permissions and their filters need not be defined in the same Context, but they _will_ be evaluated at test time.

All filter conditions currently supported come down to these distinct types:

+ Is the GPO defined in the currently loaded configuration?
+ Is the GPO linked to this specific OU, or anywhere below it, or to any OU directly below it?
+ Is the GPO named like this? (Exact comparison / Wildcard / Regex)

The name chosen for a condition is arbitrary, but can only contain letters, numbers and underscore.
