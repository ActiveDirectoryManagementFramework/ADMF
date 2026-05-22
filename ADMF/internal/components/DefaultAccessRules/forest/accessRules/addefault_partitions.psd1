
#region Partitions
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'CreateChild'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ListObject, GenericExecute'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'FSMO-Role-Owner'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'UPN-Suffixes'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-DS-SPN-Suffixes'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-DS-Enabled-Feature'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-DS-JetDB-Page-Size'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-DS-Behavior-Version'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Public-Information'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'Descendents'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-DS-NC-RO-Replica-Locations'
    InheritedObjectType   = 'Cross-Ref'
}
@{
    Path                  = 'CN=Partitions,%ConfigurationDN%'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = '268435456'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Enterprise Configuration,CN=Partitions,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Enterprise Configuration,CN=Partitions,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Enterprise Schema,CN=Partitions,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Enterprise Schema,CN=Partitions,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

@{
    ObjectCategory        = 'crossRef-DNSZone'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren, ReadProperty, DeleteTree, ExtendedRight, Delete, GenericWrite, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'Undefined'
}
@{
    ObjectCategory        = 'crossRef-DNSZone'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren, ReadProperty, DeleteTree, ExtendedRight, Delete, GenericWrite, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'Undefined'
}

@{
    ObjectCategory        = 'crossRef-Domain'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'crossRef-Domain'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#region Partitions