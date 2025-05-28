@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Deny'
    ObjectType            = 'X509-Cert'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Deny'
    ObjectType            = 'Alt-Security-Identities'
    InheritedObjectType   = 'Computer'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Deny'
    ObjectType            = 'X509-Cert'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Deny'
    ObjectType            = 'Service-Principal-Name'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Exchange-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = 'S-1-5-20'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Exchange-Personal-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Admin-Display-Name'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Proxy-Addresses'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Data-Encryption-Policy-Link'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Show-In-Address-Book'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Exchange-Personal-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Dynamic-Distribution-List'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Legacy-Exchange-DN'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Display-Name'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Garbage-Coll-Period'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Public-Delegates'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Exchange-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Display-Name-Printable'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Text-Encoded-OR-Address'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Organization Management'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'E-mail-Addresses'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Delegated Setup'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'User-Account-Restrictions'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Mobile-Mailbox-Flags'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Safe-Recipients-Hash'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-UM-Dtmf-Map'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Blocked-Senders-Hash'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-UM-Server-Writable-Flags'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Exchange-Personal-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Synchronize'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-User-Culture'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Mailbox-Security-Descriptor'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Canonical-Name'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Public-Delegates'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Exchange-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-UM-Spoken-Name'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'User-Account-Control'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Group-Type'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-UM-Pin-Checksum'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Picture'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Is-Member-Of-DL'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Safe-Senders-Hash'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Garbage-Coll-Period'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren, ReadProperty, WriteProperty, ListObject'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Active-Sync-Device'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren'
    InheritanceType       = 'Descendents'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Active-Sync-Devices'
    InheritedObjectType   = 'User'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren'
    InheritanceType       = 'Descendents'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Active-Sync-Devices'
    InheritedObjectType   = 'inetOrgPerson'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Servers'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ListObject, Delete'
    InheritanceType       = 'Children'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = 'ms-Exch-Active-Sync-Device'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'Descendents'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = 'ms-Exch-Public-Folder'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'Descendents'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = 'ms-Exch-Active-Sync-Devices'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Dynamic-Distribution-List'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren, ReadProperty, WriteProperty, ListObject'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Public-Folder'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Legacy-Exchange-DN'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Garbage-Coll-Period'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Public-Delegates'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Exchange-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Text-Encoded-OR-Address'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Personal-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'E-mail-Addresses'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Display-Name-Printable'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Public-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Display-Name'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-Exch-Data-Encryption-Policy-Link'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Admin-Display-Name'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Exchange-Personal-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Show-In-Address-Book'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AdminSDHolder,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\Exchange Trusted Subsystem'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = 'Proxy-Addresses'
    InheritedObjectType   = '<All>'
}