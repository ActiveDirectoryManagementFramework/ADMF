@{
    Name        = 'cfg_controlAccessRight'
    ObjectClass = 'controlAccessRight'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=controlAccessRight)'
    SearchBase  = '%ConfigurationDN%'
}