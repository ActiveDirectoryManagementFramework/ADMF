@{
    Name = 'msDFSR-LocalSettings'
    ObjectClass = 'msDFSR-LocalSettings'
    Property = @('Name')
    TestScript = { $args[0].ObjectClass -eq 'msDFSR-LocalSettings' }
    LDAPFilter = '(objectCategory=msDFSR-LocalSettings)'
}