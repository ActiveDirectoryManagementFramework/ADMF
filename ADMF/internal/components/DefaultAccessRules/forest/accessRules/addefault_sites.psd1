@{
    Path                  = 'CN=Sites,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Sites,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-498'
    ActiveDirectoryRights = 'Self'
    InheritanceType       = 'Descendents'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-DS-JetDB-Page-Size'
    InheritedObjectType   = 'NTDS-DSA'
}
@{
    Path                  = 'CN=Sites,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-498'
    ActiveDirectoryRights = 'Self'
    InheritanceType       = 'Descendents'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-DS-Behavior-Version'
    InheritedObjectType   = 'NTDS-DSA'
}
@{
    Path                  = 'CN=Sites,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

@{
    ObjectCategory        = 'cfg_ntdssettings'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, DeleteTree, ExtendedRight, Delete, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_ntdssettings'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

@{
    ObjectCategory        = 'cfg_nTDSSiteSettings'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, DeleteTree, ExtendedRight, Delete, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_nTDSSiteSettings'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

@{
    Path                  = 'CN=Subnets,CN=Sites,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Subnets,CN=Sites,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

@{
    Path                  = 'CN=Inter-Site Transports,CN=Sites,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Inter-Site Transports,CN=Sites,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

@{
    Path                  = 'CN=IP,CN=Inter-Site Transports,CN=Sites,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=IP,CN=Inter-Site Transports,CN=Sites,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=SMTP,CN=Inter-Site Transports,CN=Sites,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=SMTP,CN=Inter-Site Transports,CN=Sites,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

@{
    ObjectCategory        = 'cfg_siteLink'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_siteLink'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}