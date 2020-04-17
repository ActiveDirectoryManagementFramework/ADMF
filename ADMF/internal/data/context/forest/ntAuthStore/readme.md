# NTAuthStore

## Synopsis

The NTAuthStore component allows you to define certificates to apply to the central store of trusted certificates.
Useful for rolling out trust to a central PKI in a dedicated forest.

## Authorative and non-Authorative

By default, the Component only ADDS certificates to the NTAuthStore without removing certificates not defined (non-Authorative).

Switching to Authorative mode causes it to remove undefined certificates.

## Defining Configuration

To define the certificates to register, simply drop the .cer files in this folder.
All certificates thus found will be included.

> Authorative Mode

To define the authorative mode, drop a json file in this folder, formed like this:

```json
{
	Authorative: true
}
```
