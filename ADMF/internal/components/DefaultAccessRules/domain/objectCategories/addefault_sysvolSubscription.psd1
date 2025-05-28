@{
    Name = 'sysvolSubscription'
    ObjectClass = 'msDFSR-Subscription'
    Property = @('cn')
    TestScript = { $args[0].CN -eq 'SYSVOL Subscription' }
    LDAPFilter = '(&(objectCategory=serviceConnectionPoint)(cn=SYSVOL Subscription))'
}