function Invoke-PostCredentialProvider {
    <#
        .SYNOPSIS
            Executes the PostScript action of a credential provider.

        .DESCRIPTION
            Executes the PostScript action of a credential provider.

        .PARAMETER ProviderName
            Name of the credential provider to use.

        .PARAMETER Server
            The original server targeted.

        .PARAMETER Credential
            The original credentials specified by the user.

        .PARAMETER Cmdlet
            The $PSCmdlet object of the calling command.
            Used to kill it with maximum prejudice in case of error.

        .EXAMPLE
            PS C:\> Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential

            Performs any post-execution action registered for the $CredentialProvider (if any)
    #>
    [CmdletBinding()]
    param (
        [string]
        $ProviderName,

        [PSFComputer]
        $Server,

        [AllowNull()]
        [PSCredential]
        $Credential,

        [System.Management.Automation.PSCmdlet]
        $Cmdlet = $PSCmdlet
    )

    if (-not $script:credentialProviders[$ProviderName]) {
        Stop-PSFFunction -String 'Invoke-PostCredentialProvider.Provider.NotFound' -StringValues $ProviderName -EnableException $true -Cmdlet $Cmdlet
    }

    if (-not $script:credentialProviders[$ProviderName].PostScript) { return }

    $argument = [PSCustomObject]@{
        Server = $Server
        Credential = $Credential
    }

    try { $null = $script:credentialProviders[$ProviderName].PostScript.Invoke($argument) }
    catch {
        Stop-PSFFunction -String 'Invoke-PostCredentialProvider.Provider.ExecutionError' -StringValues $ProviderName -EnableException $true -ErrorRecord $_ -Cmdlet $Cmdlet
    }
}