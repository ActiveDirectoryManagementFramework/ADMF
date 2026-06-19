@{
    Name        = 'msDNS-ServerSettings'
    ObjectClass = 'msDNS-ServerSettings'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=msDNS-ServerSettings)'
    SearchBase  = 'CN=Sites,%ConfigurationDN%'
}