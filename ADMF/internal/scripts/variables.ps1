# The list of currently applied context sets
$script:loadedContexts = @()

# The list of contexts per domain/server
$script:assignedContexts = @{ }

# The list of registered credentials providers
$script:credentialProviders = @{ }

# Currently resolved domain controller
$script:resolvedDomainController = $null