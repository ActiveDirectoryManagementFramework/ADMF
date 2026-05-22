@{
    Name        = 'cfg_claim_valueType'
    ObjectClass = 'msDS-ValueType'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=msDS-ValueType)'
    SearchBase  = 'CN=Claims Configuration,CN=Services,%ConfigurationDN%'
}