# Service Accounts

## Synopsis

Group Managed Service Accounts are a special kind of user account that is treated by the system more like a computer account.
They are usually used to run services and scheduled task.
Their key differentiating feature is that their password is managed by the system and automatically changed without causing a service disruption.

## Description

This component is designed to manage deployment of Group Managed Service Accounts in the managed domains.
It can control all properties of these accounts as well as which accounts are allowed to access the password of the respective service account.

Each individual computer that is supposed to use a given gMSA needs to be specifically authorized for this, as it will otherwise incapable of using the account.

To authorize a computer account however, some considerations were necessary.
ADMF does not support managing computer accounts (other than permissions, anyway), as these are rarely standardized manageable and risk of account damage with direct service disruption was judged too likely.
However, with computer accounts often having unique names between environments, just specifying a name would be problematic.

This, this Component has three ways to target principals that are authorized to access the gMSA password:

+ Explicit Computer Name: In case you can guarantee the name is the same across environments - or only have one environment - explicitly specifying the name should be fine.
+ Optional Computer Name: In this scenario, a computer account is authorized _if that computer exists_ . This is suitable for organizations with only few environments or as a quick & dirty stop-gap to get something working "right away".
+ [Object Category](object-categories.html): The most flexible choice, this allows define authorized principals by a flexible filter set. It is the only supported way to add non-computer-principals.

## Examples

Defines a simple gMSA with minimal properties:

```json
[
    {
        "Name": "svc_one",
        "Path": "OU=ServiceAccounts,OU=0001,OU=MyOrg,%DomainDN%",
        "Description": "First service Account",
        "DNSHostName": "svc_one.%domainfqdn%"
    }
]
```

Defines a gMSA that will have two computer accounts added as authorized to retrieve the password.
If the computer accounts do not exist, it will be logged, but no warning will be generated.

```json
[
    {
        "Name": "svc_two",
        "Path": "OU=ServiceAccounts,OU=0001,OU=MyOrg,%DomainDN%",
        "Description": "Second service Account",
        "DNSHostName": "svc_two.%domainfqdn%",
        "ComputerNameOptional": [ "ADMFADMINDC$", "ADMFADMINDC2$" ]
    }
]
```

A more complex gMSA configuration that ...

+ Adds a service principal name to the gMSA
+ Assigns all members that are part of the Object Category "T0WebServers" permission to retrieve the password
+ Adds an additional attribute - an adminDescription.

```json
[
    {
        "Name": "svc_three",
        "Path": "OU=ServiceAccounts,OU=0001,OU=MyOrg,%DomainDN%",
        "Description": "Three service Account",
        "DNSHostName": "svc_three.%domainfqdn%",
        "ServicePrincipalName": [ "HOST/svc_three.%domainfqdn%" ],
        "DisplayName": "Service Three",
        "ObjectCategory": [ "T0WebServers" ],
        "Attributes": {
            "adminDescription": "Does some awesome stuff"
        }
    }
]
```

## Tools

The following command can be used to generate a configuration based off an existing deployment.

> Note: It will create this list with direct assigning all principals allowed to retrieve the password as computername.
> This may not be correct (it will not work with non-computer accounts) and should ideally be converted to object categories if possible.
> (Using Object Categories is the most flexible and generally recommended approach to authorizing access to gMSA)

```powershell
Get-ADServiceAccount -Filter * -Properties * | ForEach-Object {
    $data = @{
        Name        = $_.SamAccountName.Trim('$')
        Path        = ($_.DistinguishedName -split ",", 2)[1] -replace ',DC=.+$', ',%DomainDN%'
        Description = "$($_.Description)"
        DNSHostName = $_.DNSHostName
    }
    if ($_.ServicePrincipalName) { $data.ServicePrincipalName = $_.ServicePrincipalName | Write-Output }
    if ($_.DisplayName) { $data.DisplayName = $_.DisplayName }
    if ($_.PrincipalsAllowedToRetrieveManagedPassword) {
        $data.ComputerName = ($_.PrincipalsAllowedToRetrieveManagedPassword | Get-ADObject -Properties SamAccountName).SamAccountName
    }
    [PSCustomObject]$data
} | ConvertTo-Json
```

## Properties

### Name

Name of the Service Account.
This must be a legal name, 15 characters or less (no trailing $ needed).
The SamAccountName will be automatically calculated based off this setting (by appending a $).

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### DNSHostName

The DNSHostName of the gMSA.

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### Description

Describe what the gMSA is supposed to be used for.

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### Path

The path where to place the gMSA.

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### ServicePrincipalName

Any service principal names to add to the gMSA.

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### DisplayName

A custom DisplayName for the gMSA.
Note, this setting will be ignored in the default dsa.msc console!
It only affects other applications that might be gMSA aware and support it.

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### ObjectCategory

Only thus designated principals are allowed to retrieve the password to the gMSA.
Using this you can grant access to any members of given Object Categories.

### ComputerName

Only thus designated principals are allowed to retrieve the password to the gMSA.
Using this you can grant access to an explicit list of computer accounts.
A missing computer will cause a warning, but not otherwise fail the process.

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### ComputerNameOptional

Only thus designated principals are allowed to retrieve the password to the gMSA.
Using this you can grant access to an explicit list of computer accounts.
A missing computer will be logged but not otherwise noted.

> This parameter uses [name resolution](../../advanced/name-mapping.html).

### Enabled

Whether the account should be enabled or disabled.
By default, this is 'Undefined', causing the workflow to ignore its enablement state.

### Present

Whether the account should exist or not.
By default, it should.
Set this to $false in order to explicitly delete an existing gMSA.

### Attributes

Offer additional attributes to define.
This can be either a hashtable or an object and can contain any writeable properties a gMSA can have in your organization.
