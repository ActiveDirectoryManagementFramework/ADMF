@{
    Name        = 'cfg_pki_msPKI-PrivateKeyRecoveryAgent'
    ObjectClass = 'msPKI-PrivateKeyRecoveryAgent'
    Property    = @('Name')
    TestScript  = { $true }
    LDAPFilter  = '(objectClass=msPKI-PrivateKeyRecoveryAgent)'
    SearchBase  = 'CN=KRA,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    SearchScope = 'OneLevel'
}