@{
    Name        = 'DnsNode'
    ObjectClass = 'dnsNode'
    Property    = @('name')
    TestScript  = { $true }
    LDAPFilter  = '(objectCategory=dnsNode)'
}