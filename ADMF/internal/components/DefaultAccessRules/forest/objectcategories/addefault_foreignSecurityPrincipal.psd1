@{
    Name        = 'cfg_foreignSecurityPrincipal'
    ObjectClass = 'foreignSecurityPrincipal'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=foreignSecurityPrincipal)'
    SearchBase  = '%ConfigurationDN%'
}