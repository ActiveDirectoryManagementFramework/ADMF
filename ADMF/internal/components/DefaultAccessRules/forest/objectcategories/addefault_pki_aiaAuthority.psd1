@{
    Name        = 'cfg_pki_aiaAuthority'
    ObjectClass = 'certificationAuthority'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=certificationAuthority)'
    SearchBase  = 'CN=AIA,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    SearchScope = 'OneLevel'
}