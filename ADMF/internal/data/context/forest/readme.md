# Forest

## Forest Level

You can define the functional level of the forest in configuration.
To do so, place a file named `forest_level.json` straight in the forest folder.

This file should be a simple json object with a single property: Level.

Example content:

```json
{
    "Level":  "2016"
}
```

Supported values: 2008R2, 2012, 2012R2 or 2016

> It is impossible to downgrade a forest functional level, so even if you define a low level, it will not be applied if the forest is already at a higher level.

> It is impossible to upgrade the forest to a level not yet reached by all member domains.
In order to upgrade the forest functional level, be sure to first update every single domain.
