# Exchange System Objects

## Description

This Component ensures that the domain is configured for Exchange.
Without deploying this, users in the specific domain cannot have mailboxes.

> Deploying Exchange System Objects to a domain requires the forest to already have been prepared for this version.

## Example Configuration

Configure schema updates only to Level of Exchange 2019 CU6:

```json
{
    "LocalImagePath":  "C:\\images\\exchange_2019CU6.iso",
    "ExchangeVersion":  "2019CU6"
}
```

## Parameters

### LocalImagePath

The path where to find the Exchange ISO file
Must be local on the remote server connected to!
Updating the Exchange AD settings is only supported when executed through the installer contained in that ISO file without exceptions.

### ExchangeVersion

The version of the Exchange server to apply.
E.g. 2016CU6
We map Exchange versions to their respective identifier in AD:
ObjectVersion in the domain's Microsoft Exchange System Objects container.
This parameter is to help avoiding to have to look up that value.
If your version is not supported by us yet, look up the version number and explicitly bind it to -ObjectVersion instead.

### ObjectVersion

The object version on the "Microsoft Exchange System Objects" container in the domain.
