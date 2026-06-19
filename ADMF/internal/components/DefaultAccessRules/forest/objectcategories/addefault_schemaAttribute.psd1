@{
    Name        = 'schemaAttribute'
    ObjectClass = 'attributeSchema'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=attributeSchema)'
}