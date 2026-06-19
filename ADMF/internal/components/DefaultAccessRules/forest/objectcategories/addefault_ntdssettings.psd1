@{
    Name        = 'cfg_ntdssettings'
    ObjectClass = 'nTDSDSA'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=nTDSDSA)'
    SearchBase  = 'CN=Sites,%ConfigurationDN%'
}