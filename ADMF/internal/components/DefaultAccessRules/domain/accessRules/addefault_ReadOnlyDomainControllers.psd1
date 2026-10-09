
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Operating-System-Hotfix'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Operating-System-Service-Pack'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Operating-System-Version'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Operating-System'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'ms-DS-Supported-Encryption-Types'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Display-Name'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Description'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'User-Account-Restrictions'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'Self'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DNS-Host-Name'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'Self'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Service-Principal-Name'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'SAM-Account-Name'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'ReadOnlyDomainController'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'User-Logon'
    InheritedObjectType   = '<All>'
}
#TODO: Add RODC-Permissions cannot be assigned yet to itself
#TODO: RODC Krbtgt permissions for matching RODC Object
#TODO: Subnodes under dfsr-LocalSettings need to assign permissions to more than just their direct parent  