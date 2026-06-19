@{
    Name        = 'cfg_pki_CDP'
    ObjectClass = 'container'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=container)'
    SearchBase  = 'CN=CDP,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    SearchScope = 'OneLevel'
}