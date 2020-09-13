# Exchange Schema

## Description

This component uses an Exchange Server ISO image to apply Exchange Schema updates or upgrade a forest's Exchange topology for a given Exchange level.

In order to apply these settings in a supported manner, using the official exchange installer is required.
There is no validation, whether the provided ISO image is actually of the required version!

> At this time, the ISO must somehow be provided on the target DC.
This solution does not - yet - support copying it as part of the operation.

## Example Configuration

Configure schema updates only to Level of Exchange 2019 CU6:

```json
{
	"LocalImagePath":  "C:\\images\\exchange_2019CU6.iso",
	"ExchangeVersion":  "2019CU6",
	"SchemaOnly":  true
}
```

Configure Schema and Configuration level changes for Exchange 2019 CU6:

```json
{
	"LocalImagePath":  "C:\\images\\exchange_2019CU6.iso",
	"ExchangeVersion":  "2019CU6",
	"OrganizationName":  "Contoso"
}
```

> Note: The exchange installer will generally also prepare the root domain as part of the update.

## Parameters

### LocalImagePath

The path where to find the Exchange ISO file
Must be local on the remote server connected to!
Updating the Exchange AD settings is only supported when executed through the installer contained in that ISO file without exceptions.

### ExchangeVersion

The version of the Exchange server to apply.
E.g. 2016CU6
We map Exchange versions to their respective identifiers in AD:
RangeUpper in schema and ObjectVersion in configuration.
This parameter is to help avoiding to have to look up those values.
If your version is not supported by us yet, look up those numbers and explicitly bind it to -RangeUpper and -ObjectVersion isntead.

### RangeUpper

The explicit RangeUpper schema attribute property, found on the ms-Exch-Schema-Version-Pt class in schema.

### ObjectVersion

The object version on the msExchOrganizationContainer type object in the configuration.
Do NOT confuse that with the ObjectVersion of the exchange object in the default Naming Context (regular domain space).

### OrganizationName

The name of the Exchange Organization.
Only used for CREATING a new Exchange deployment.
Make sure to customize this if you are picky about names like that.

### SchemaOnly

Whether to only apply the schema updates.
Enabling this will mean no configuration scope changes are applied and the root domain also will not be pre-configured for Exchange.
