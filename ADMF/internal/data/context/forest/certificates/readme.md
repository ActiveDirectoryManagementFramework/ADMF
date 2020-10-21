# Certificates

> This Component does NOT follow the usual pattern of the corresponding "Register"-Command's parameters are mapped straight through
> Reading the configuration guidance is strongly recommended!

## Synopsis

This Component manages certificates in the forest-wide certificate stores.

## Description

With this you can define certificates as ...

+ Root CA Certificate
+ Sub CA Certificate
+ Cross CA Certificate
+ NT Authentication Certificate
+ Key Recovery Agent Certificate

This Component supports adding and removing certificates.
You can declare the defined list of certificates as authorative (removing non-defined certificates) or merely add your certificates to the list of already existing certs.

## Defining Configuration

Fundamentally, there are a few aspects you can define:

+ Certificate to remove (by thumbprint)
+ Certificate to add (full, public certificate needed)
+ Which Certificate type to claim authority over

All Json bits are combinable, you can use as many json files as desired to define your environment.

> Types

The configuration will always require specifying the type of certificate to affect.
These are described above but defined using the following labels:

NTAuthCA, RootCA, SubCA, CrossCA, KRA

### Removing a Certificate

Removing a certificate requires specifying the type and the thumbprint of the certificate:

```json
{
    "Delete": [
        {
            "Type": "RootCA",
            "Thumbprint": "9D385AC584BE4370BF11C91BE0720FA04DD0071F"
        }
    ]
}
```

### Adding a Certificate

There are two ways to define adding a certificate:

+ Json configuration
+ .cer file

> .cer file

The easiest solution is to place the certificate as a .cer file in the Context folder.
In order for this solution to work, the filename _must_ begin with the type of certificate it is.

For example: `RootCA_contoso.com.cer` would add the certificate to the RootCA store.

> Json configuration

To define it in json, create it thus:

```json
{
    "Add": [
        {
            "Type": "RootCA",
            "Certificate": "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"
        }
    ]
}
```

Not the neatest way to define a certificate, so while this method is supported, it is not recommended.
The certificate data is created using the command `ConvertTo-PSFClixml`.

For example this line would generate the data from the local computer's certificate store:

```powershell
Get-ChildItem Cert:\LocalMachine\My\ | Where-Object Subject -eq 'CN=contoso.com' | ConvertTo-PSFClixml
```

### Establishing Authority

To declare authority over a type of certificate, define it thus:

```json
{
    "Authority": [
        {
            "Type": "RootCA",
            "Authorative":  true
        },
        {
            "Type": "SubCA",
            "Authorative":  true
        }
    ]
}
```

### Combining Settings

All three sets of json configuration can exist in the same configuration file or be split across multiple ones as desired.
Example with all settings combined:

```json
{
    "Authority": [
        {
            "Type": "RootCA",
            "Authorative":  true
        },
        {
            "Type": "SubCA",
            "Authorative":  true
        }
    ],
    "Delete": [
        {
            "Type": "RootCA",
            "Thumbprint": "9D385AC584BE4370BF11C91BE0720FA04DD0071F"
        }
    ],
    "Add": [
        {
            "Type": "RootCA",
            "Certificate": "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"
        }
    ]
}
```

Json files and .cer files can freely coexist.
