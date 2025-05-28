@{
    Path                  = 'CN=Monitoring Mailboxes,CN=Microsoft Exchange System Objects,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'DeleteTree'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Exchange Install Domain Servers,CN=Microsoft Exchange System Objects,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}