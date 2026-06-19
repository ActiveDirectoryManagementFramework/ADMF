@{
    Name        = 'schemaClass'
    ObjectClass = 'classSchema'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=classSchema)'
}