# AccessRule Processing Mode

## Description

When processing AccessRules, by default all undesired rules on a configured object will be removed.
This is great for objects fully under your control.
But what about scenarios where you just want to enable another process to self-manage an environment?
At that point, where other servies may interfere with your deployed configuration you may want to instead define your settings as a minimum while disregarding/ignoring other rules defined.

This is what the AccessRule Processing Mode controls.

With that you can define which objects to fully control and where to just add to.
You can target by:

+ Explicit Path
+ SubTree under a specific path
+ ObjectCategory

## Precedence

With the various targeting modes, several rules may apply to the same AD object.
When that happens, the settings are applied in the following, descending precedence:

+ Explicit Path
+ ObjectCategory
+ SubTree-item with the longest name among applicable SubTree-definitions

This allows to define multiple SubTree tiers, where only the most specific one will apply to a given object.

## Overriding settings

Each Processing Mode can be overridden by a different Context.
A Processing Mode is identified by: PathMode & Path or ObjectCategory.

This means an Explicit Path rule can only be overriden by a matching Explicit Path rule (which may have a different Processing Mode).

## Example Configurations

Configuration entries can be defined by adding them to the current folder as json files.
The specific filename is not important and any number of configuration files can be defined.

> Explicit Path Rule

```json
{
	"Path":  "CN=MyGroup3,OU=Groups,OU=DomainContent,%DomainDN%",
	"Mode":  "Additive"
}
```

> SubTree Path Rule

```json
{
	"Path":  "OU=Groups,OU=DomainContent,%DomainDN%",
	"PathMode":  "SubTree",
	"Mode":  "Additive"
}
```

> ObjectCategory Rule

```json
{
	"ObjectCategory":  "DomainControllers",
	"Mode":  "Constrained"
}
```

## Parameters

### Path

> Supports string replacement

The path in ad to the targeted item.
Whether this is an Explicit or SubTree Path-rule is determined by the `PathMode` rule.

### PathMode

Optional: true | Options: SingleItem, SubTree | Default: SingleItem

Determines whether a Path-rule is either Explicit or SubTree:

+ SingleItem: Processing Mode only applies to the exactly specified path.
+ SubTree: Processing Mode applies to specified path and all items beneath it (unless overridden).

### ObjectCategory

Instead of targeting by path, target a specific ObjectCategory.

### Mode

Options: 'Constrained', 'Additive'

The AccessRule Processing Mode to apply:

+ Constrained: Any non-defined AccessRule will be removed
+ Additive: Any non-defined AccessRule will be ignored
+ Defined: Any non-defined [AccessRule](accessrules.html) will be ignored, _unless_ it affects an identity for which a non-matching definition exists.
