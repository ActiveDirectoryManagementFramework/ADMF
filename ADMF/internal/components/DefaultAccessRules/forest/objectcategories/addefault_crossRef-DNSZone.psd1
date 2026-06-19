@{
    Name        = 'crossRef-DNSZone'
    ObjectClass = 'crossRef'
    Property    = @('systemFlags')
    TestScript  = { $args[0].systemFlags -eq 5 }
    LDAPFilter  = '(systemFlags=5)'
    SearchBase  = 'CN=Partitions,%ConfigurationDN%'
}