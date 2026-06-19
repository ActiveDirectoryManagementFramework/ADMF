@{
    Name        = 'crossRef-Domain'
    ObjectClass = 'crossRef'
    Property    = @('systemFlags')
    TestScript  = { $args[0].systemFlags -eq 3 }
    LDAPFilter  = '(systemFlags=3)'
    SearchBase  = 'CN=Partitions,%ConfigurationDN%'
}