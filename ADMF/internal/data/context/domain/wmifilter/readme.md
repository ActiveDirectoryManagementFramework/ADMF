# WMI Filter

## Synopsis

Add configuration data to manage wmi filters

Place any number of json/psd1 files in this folder.
Each file should contain an array of objects.
What properties to place on each object depends on the parameters present on the relevant 'Register-*'-Command.
For a full description of the supported properties, see the parameter descriptions:

  Get-Help Register-DMWmiFilter -Detailed

## Example

Example configuration using the psd1 file format:

```powershell
@{
    Name        = 'Client'
    Description = 'Applies to all client OS versions'
    Query       = 'SELECT * FROM Win32_OperatingSystem WHERE ProductType = 1'
    # Namespace = 'root\CIMv2'
    Author      = 'Friedrich Weinmann'
    CreatedOn   = '2022-10-21'
}
```
