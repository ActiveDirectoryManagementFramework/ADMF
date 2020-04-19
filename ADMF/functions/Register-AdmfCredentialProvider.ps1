function Register-AdmfCredentialProvider {
    <#
    .SYNOPSIS
        Registers a credential provider used by the ADMF.
    
    .DESCRIPTION
        Registers a credential provider used by the ADMF.

        Credential providers are used for translating the credentials to use for all actions performed against active directory.
        For example, the ADMF could be extended to support a password safe solution:
        When connecting to a target domain, this provider scriptblock would retrieve the required credentials from a password safe solution.

        A credential provider consists of two scriptblocks:
        - A PreScript that is executed before running any commands. It must return either a PSCredential object (if applicable) or $null (if default windows credentials should be used instead).
        - A PostScript that is executed after all component commands have been executed. It need not return anything.

        Both scriptblocks receive a single input object, with two properties:
        - Server: The computer / domain targeted
        - Credential: The credentials originally provided (if any - this may be $null instead!)
    
    .PARAMETER Name
        The name of the credential provider.
        Each name must be unique, registering a provider using an existing name overwrites the previous provider.
        The provider "default" exists as part of ADMF and will be used if no other is specified. Overriding it allows you to change the default provider intentionally,
        but may remove your ability to NOT use any credential transformations, so use with care.
    
    .PARAMETER PreScript
        The script to execute before performing actions, in order to resolve the correct credentials to use.
        - If it returns a credential object, this object will be used for authenticating all AD operations (including WinRM against domain controllers!).
        - If it returns nothing / only non-credential objects, instead the default windows identity of the user is used.
    
    .PARAMETER PostScript
        This script is executed after performing all actions.
        You can use this optional script to perform any cleanup actions if necessary.
    
    .EXAMPLE
        PS C:\> Register-AdmfCredentialProvider -Name AZKeyVault -PreScript $keyVaultScript

        Registers the scriptblock defined in $keyVaultScript as "AZKeyVault" provider.
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]
        $Name,

        [Parameter(Mandatory = $true)]
        [Scriptblock]
        $PreScript,

        [Scriptblock]
        $PostScript
    )

    $script:credentialProviders[$Name] = [PSCustomObject]@{
        PSTypeName = 'Admf.CredentialProvider'
        Name = $Name
        PreScript = $PreScript
        PostScript = $PostScript
    }
}