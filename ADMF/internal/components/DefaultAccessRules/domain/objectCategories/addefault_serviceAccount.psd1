@{
    Name = 'serviceAccount'
    ObjectClass = 'msDS-GroupManagedServiceAccount'
    Property = @('Name')
    TestScript = { $args[0].ObjectClass -eq 'msDS-GroupManagedServiceAccount' }
    LDAPFilter = '(objectCategory=msDS-GroupManagedServiceAccount)'
}