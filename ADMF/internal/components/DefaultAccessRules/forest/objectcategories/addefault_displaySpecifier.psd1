@{
    Name        = 'cfg_displaySpecifier'
    ObjectClass = 'displaySpecifier'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=displaySpecifier)'
    SearchBase  = '%ConfigurationDN%'
}