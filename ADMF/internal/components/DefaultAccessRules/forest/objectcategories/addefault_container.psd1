@{
    Name        = 'cfg_container'
    ObjectClass = 'Container'
    Property    = @('DistinguishedName')
    TestScript  = { $args[0].DistinguishedName -notmatch ',CN=ForestUpdates,' }
    LDAPFilter  = '(objectClass=container)(!(distinguishedName=*CN=ForestUpdates,%ConfigurationDN%))'
    SearchBase  = '%ConfigurationDN%'
}