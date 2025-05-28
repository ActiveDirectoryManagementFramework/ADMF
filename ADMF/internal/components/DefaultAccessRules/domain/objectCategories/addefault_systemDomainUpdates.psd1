@{
    Name = 'systemDomainUpdates'
    ObjectClass = 'container'
    Property = 'DistinguishedName'
    TestScript = { $args[0].DistinguishedName -like '*,CN=DomainUpdates,CN=System,DC=*' }
    LDAPFilter = '(objectCategory=container)'
    SearchBase = 'CN=DomainUpdates,CN=System,%DomainDN%'
}