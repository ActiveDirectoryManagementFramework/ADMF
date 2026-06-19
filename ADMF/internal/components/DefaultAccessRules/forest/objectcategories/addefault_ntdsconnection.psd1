@{
    Name        = 'cfg_ntdsconnection'
    ObjectClass = 'nTDSConnection'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=nTDSConnection)'
    SearchBase  = 'CN=Sites,%ConfigurationDN%'
}