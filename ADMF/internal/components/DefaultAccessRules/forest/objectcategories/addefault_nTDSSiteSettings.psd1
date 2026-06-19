@{
    Name        = 'cfg_nTDSSiteSettings'
    ObjectClass = 'nTDSSiteSettings'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=nTDSSiteSettings)'
    SearchBase  = 'CN=Sites,%ConfigurationDN%'
}