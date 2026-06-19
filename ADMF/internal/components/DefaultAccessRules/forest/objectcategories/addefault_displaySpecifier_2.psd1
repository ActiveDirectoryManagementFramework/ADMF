@{
    Name        = 'cfg_displaySpecifier_2'
    ObjectClass = 'dSUISettings'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=dSUISettings)'
    SearchBase  = '%ConfigurationDN%'
}