@{
    Name        = 'cfg_ForestUpdateOperations'
    ObjectClass = 'container'
    Property    = @('Name')
    TestScript  = { $args[0].Name -like "*-*" }
    LDAPFilter  = '(name=*-*)'
    SearchBase  = 'CN=Operations,CN=ForestUpdates,%ConfigurationDN%'
}