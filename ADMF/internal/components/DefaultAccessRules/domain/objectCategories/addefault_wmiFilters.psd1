@{
    Name        = 'WMIFilters'
    ObjectClass = 'msWMI-Som'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectCategory=msWMI-Som)'
    SearchBase  = 'CN=SOM,CN=WMIPolicy,CN=System,%DomainDN%'
}