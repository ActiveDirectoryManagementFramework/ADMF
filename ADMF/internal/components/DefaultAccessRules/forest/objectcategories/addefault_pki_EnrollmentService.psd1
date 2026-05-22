@{
    Name        = 'cfg_pki_EnrollmentService'
    ObjectClass = 'pKIEnrollmentService'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=pKIEnrollmentService)'
    SearchBase  = 'CN=Enrollment Services,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    SearchScope = 'OneLevel'
}