@{
    Name        = 'cfg_pki_certificationAuthority'
    ObjectClass = 'certificationAuthority'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=certificationAuthority)'
    SearchBase  = 'CN=Certification Authorities,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    SearchScope = 'OneLevel'
}