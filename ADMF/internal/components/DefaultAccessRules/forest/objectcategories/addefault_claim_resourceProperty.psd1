@{
    Name        = 'cfg_claim_resourceProperty'
    ObjectClass = 'msDS-ResourceProperty'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=msDS-ResourceProperty)'
    SearchBase  = 'CN=Claims Configuration,CN=Services,%ConfigurationDN%'
}