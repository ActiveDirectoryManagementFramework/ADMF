@{
    Name        = 'cfg_siteLink'
    ObjectClass = 'siteLink'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=siteLink)'
    SearchBase  = 'CN=Sites,%ConfigurationDN%'
}