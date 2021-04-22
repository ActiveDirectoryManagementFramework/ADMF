# Servers

The servers Component deals with moving domain controllers to the sites they are supposed to be at, based off IPAddress and site subnets.
As such, there is generally not much need to configure this component.

That said, there is however one setting that can be set:
To disable it.

Add a json file with this content to disable automatically assigning servers to sites:

```json
{
    "NoAutoAssignment": true
}
```

With that it is now possible to disable this Component at the configuration level, where previously you needed to watch your Invoke-AdmfForest options.
