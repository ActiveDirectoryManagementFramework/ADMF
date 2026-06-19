@{
    Name        = 'cfg_pki_cRLDistributionPoint'
    ObjectClass = 'cRLDistributionPoint'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=cRLDistributionPoint)'
    SearchBase  = 'CN=CDP,CN=Public Key Services,CN=Services,%ConfigurationDN%'
}