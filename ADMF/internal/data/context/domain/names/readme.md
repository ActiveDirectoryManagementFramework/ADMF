# Names

## Synopsis

Add configuration data to register names for name mapping.
This allows you to add custom variables into your other domain definitions which will then be expanded into the full string.
For example, when defining a groupname, you could define it in configuration with a name such as "SEC-%ENV%-Network-Admins".
Then register the appropriate string under the name "ENV".
See parameter help on each individual register command to see which property supports name expansion.
Generally, all name, path or description properties should, as well as all properties referring to such a property on another object.

Place any number of json files in this folder.
Each file should contain an array of objects.
What properties to place on each object depends on the parameters present on the relevant 'Register-*'-Command.
For a full description of the supported properties, see the parameter descriptions:

  Get-Help Register-DMNameMapping -Detailed

