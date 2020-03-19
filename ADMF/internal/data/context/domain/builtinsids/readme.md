# BuiltIn SIDs

## Synopsis

Add mapping data, to map localized versions of BuiltIn SIDs.

Place any number of json files in this folder.
Each file should contain an array of objects.
What properties to place on each object depends on the parameters present on the relevant 'Register-*'-Command.
For a full description of the supported properties, see the parameter descriptions:

  Get-Help Register-DMBuiltInSID -Detailed
