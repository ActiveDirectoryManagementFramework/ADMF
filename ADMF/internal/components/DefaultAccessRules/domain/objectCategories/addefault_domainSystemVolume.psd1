@{
    Name = 'domainSystemVolume'
    ObjectClass = 'msDFSR-Subscriber'
    Property = @('CN')
    TestScript = { $args[0].CN -eq 'Domain System Volume' }
    LDAPFilter = '(&(objectCategory=msDFSR-Subscriber)(CN=Domain System Volume))'
}