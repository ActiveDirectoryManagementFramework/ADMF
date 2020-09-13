# Domain Configuration

## General Content

To define domain level objects and settings, place correctly formatted json files in their respective subfolders.
See each folder's readme file for more info on how to define these objects.

## Domain Content Mode

The content mode of a domain governs, how aggressively the DomainManagement modules goes about objects, not defined in the configuration.
For example, if there were a user object not defined in configuration, do we delete that user?

This is where we define, whether we say "Consider everything, except for the following OUs" or "Consider only the following OUs".

### Mode

The mode defines, whether we consider anything at all beyond what we define:

+ *Additive:* Do not consider anything outside of configuration.
+ *Constrained:* Consider content in OUs defined by the Include & Exclude rules

If multiple contexts define this property, the last one wins.

### Include/Exclude

Using the Include & Exclude string arrays, we can then define a list of OUs to "take under management" or "exclude from management".
That is, define OU structures, which are subject to having undefined objects deleted from, or OUs which are exempt from that.

> OUs are defined by their distinguished name. Note that %DomainDN% is automatically available as a name label.

Settings from multiple contexts will be merged.
If only Exclude rules are defined, the system implicitly creates an Include rule for "%DomainDN%".
If a later context then adds an Include rule, this no longer happens, possibly failing to apply your intent.
If you wish to mix both - or know there is a risk of it happening - and still want everything to be under management by default, manually define "%DomainDN%" as include rule.

### UserExcludePattern

Some users are hard to pre-define, and thus need to be excluded from prevention without being able to pre-determine their names explicitly.
Very common case: Exchange System Mailbox users.
For those you can define name patterns (using regex) to spare them from deletion.

### Defining Content Mode

To define the Content Mode, place a json file named "content_mode.json" in the domain folder of the context (right beside this file).
Unused properties are optional.

Example content:

```json
{
	"Mode":  "Constrained",
	"Include":  [],
	"Exclude":  [
		"OU=Resources,%DomainDN%",
		"OU=Clients,%DomainDN%",
		"OU=Company,%DomainDN%"
	],
	"UserExcludePattern":  []
}
```

## Domain Level

You can define the functional level of the domain in configuration.
To do so, place a file named `domain_level.json` straight in the domain folder.

This file should be a simple json object with a single property: Level.

Example content:

```json
{
    "Level":  "2016"
}
```

Supported values: 2008R2, 2012, 2012R2 or 2016

> It is impossible to downgrade a domain functional level, so even if you define a low level, it will not be applied if the domain is already at a higher level.