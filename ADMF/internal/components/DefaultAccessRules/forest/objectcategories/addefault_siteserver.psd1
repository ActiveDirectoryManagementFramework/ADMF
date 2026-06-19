@{
    Name        = 'cfg_siteserver'
    ObjectClass = 'server'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=server)'
    SearchBase  = 'CN=Sites,%ConfigurationDN%'
}