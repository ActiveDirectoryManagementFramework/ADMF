# Object Categories

## Synopsis

Add configuration data to manage object categories.
Some rules & settings can be applied to objects of a given Object Category, rather than a specific identity.

Each file must be a psd1 file returning a single hashtable containing the following key/value pairs:

- Name: The name by which to address the category.
- ObjectClass: The object class this category applies to. Important for performance reasons.
- Property: The properties needed to verify, whether a given object of the defined objectclass is also part of this category.
- TestScript: A scriptblock that returns $true if the first argument (an AD object) is part of the category.
- LDAPFilter: An LDAP filter to retrieve all objects of this category.

Example category from the default access rule set:

```powershell
@{
    Name = 'DomainController'
    ObjectClass = 'computer'
    Property = @('PrimaryGroupID')
    TestScript = { $args[0].PrimaryGroupID -eq 516 }
    LDAPFilter = '(&(objectCategory=computer)(primaryGroupID=516))'
}
```

For more details, see:

    Get-Help Register-DMObjectCategory -Detailed
