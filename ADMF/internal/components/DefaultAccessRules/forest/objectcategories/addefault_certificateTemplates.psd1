@{
    Name        = 'cfg_certificateTemplates'
    ObjectClass = 'pKICertificateTemplate'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=pKICertificateTemplate)'
    SearchBase  = 'CN=Public Key Services,CN=Services,%ConfigurationDN%'
}