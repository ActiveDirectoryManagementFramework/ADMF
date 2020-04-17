function Invoke-PreCredentialProvider {
    <#
        .SYNOPSIS
            Resolves credentials to use using the registered credential provider.

        .DESCRIPTION
            Resolves credentials to use using the registered credential provider.

        .PARAMETER ProviderName
            Name of the credential provider to use.

        .PARAMETER Server
            The server to connect to.

        .PARAMETER Credential
            The credentials specified by the user.

        .PARAMETER Parameter
            The parameter object resolved from the original user input.

        .PARAMETER Cmdlet
            The $PSCmdlet object of the calling command.
            Used to kill it with maximum prejudice in case of error.

        .EXAMPLE
            PS C:\> $originalArgument = Invoke-PreCredentialProvider @parameters -ProviderName $CredentialProvider -Parameter $parameters

            Resolves the credentials to use and automatically injects them into the $parameters hashtable.
            Also returns the original input for use when invoking the PostScript scriptblock of the provider.
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

        [Hashtable]
        $Parameter,

        [System.Management.Automation.PSCmdlet]
        $Cmdlet
    )
	
	if (-not $script:credentialProviders[$ProviderName])
	{
		Write-PSFMessage -Level Warning -String 'Invoke-PreCredentialProvider.Provider.NotFound' -StringValues $ProviderName
        Stop-PSFFunction -String 'Invoke-PreCredentialProvider.Provider.NotFound' -StringValues $ProviderName -EnableException $true -Cmdlet $Cmdlet
    }

    $argument = [PSCustomObject]@{
        Server = $Server
        Credential = $Credential
    }

    try { $results = $script:credentialProviders[$ProviderName].PreScript.Invoke($argument) | Where-Object { $_ -is [PSCredential] } | Select-Object -First 1 }
	catch
	{
		Write-PSFMessage -Level Warning -String 'Invoke-PreCredentialProvider.Provider.ExecutionError' -StringValues $ProviderName -ErrorRecord $_
        Stop-PSFFunction -String 'Invoke-PreCredentialProvider.Provider.ExecutionError' -StringValues $ProviderName -EnableException $true -ErrorRecord $_ -Cmdlet $Cmdlet
    }

    if ($results) {
        $Parameter['Credential'] = $results
    }
    elseif ($Parameter.ContainsKey('Credential')) { $Parameter.Remove('Credential') }
    
    return $argument
}