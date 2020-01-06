# Objects

## Synopsis

Add configuration data to manage generic ad objects

> Note: This category allows you to freely define custom AD objects of any kind. However, in opposite to the "managed" object types, this will not remove all undesired objects of its type within the management scope of the domain.

Place any number of json files in this folder.
Each file should contain an array of objects.
What properties to place on each object depends on the parameters present on the relevant 'Register-*'-Command.
For a full description of the supported properties, see the parameter descriptions:

  Get-Help Register-DMObject -Detailed

