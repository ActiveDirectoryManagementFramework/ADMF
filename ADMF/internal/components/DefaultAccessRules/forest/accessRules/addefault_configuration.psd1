#region Configuration Object
@{
    Path                  = '%ConfigurationDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, Delete, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'Descendents'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Manage-Topology'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Synchronize'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-In-Filtered-Set'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-All'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Synchronize'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Manage-Topology'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-All'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-In-Filtered-Set'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%ConfigurationDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Configuration Object

#region Wellknown Security Principals
@{
    Path                  = 'CN=WellKnown Security Principals,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=WellKnown Security Principals,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=WellKnown Security Principals,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=WellKnown Security Principals,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Wellknown Security Principals

#region Foreign Security Principals
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadControl'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-32-548'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'User-Change-Password'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Receive-As'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Personal-Information'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Email-Information'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Web-Information'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'User-Change-Password'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-10'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Send-As'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Personal-Information'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Web-Information'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Public-Information'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_foreignSecurityPrincipal'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ReadProperty'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'General-Information'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Foreign Security Principals

#region Physical Locations
@{
    Path                  = 'CN=Physical Locations,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Physical Locations,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Physical Locations,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Physical Locations,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Physical Locations

#region ForestUpdates
@{
    Path                  = 'CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'False'
}
@{
    Path                  = 'CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Windows2003Update,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Windows2003Update,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Windows2003Update,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'False'
}
@{
    Path                  = 'CN=Windows2003Update,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Windows2003Update,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=ActiveDirectoryUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ActiveDirectoryUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ActiveDirectoryUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'False'
}
@{
    Path                  = 'CN=ActiveDirectoryUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=ActiveDirectoryUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=ActiveDirectoryRodcUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ActiveDirectoryRodcUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ActiveDirectoryRodcUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'False'
}
@{
    Path                  = 'CN=ActiveDirectoryRodcUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=ActiveDirectoryRodcUpdate,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Operations,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Operations,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Operations,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'False'
}
@{
    Path                  = 'CN=Operations,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Operations,CN=ForestUpdates,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

@{
    ObjectCategory        = 'cfg_ForestUpdateOperations'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'Undefined'
}
@{
    ObjectCategory        = 'cfg_ForestUpdateOperations'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'Undefined'
}
@{
    ObjectCategory        = 'cfg_ForestUpdateOperations'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'Undefined' # Tolerated if present
}
@{
    ObjectCategory        = 'cfg_ForestUpdateOperations'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_ForestUpdateOperations'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_ForestUpdateOperations'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'Undefined'
}
#endregion ForestUpdates

#region Wide-ranging Categories
@{
    ObjectCategory        = 'cfg_container'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_container'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_displaySpecifier'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_displaySpecifier'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_displaySpecifier_2'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_displaySpecifier_2'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_controlAccessRight'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_controlAccessRight'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Wide-ranging Categories

#region Subnodes
@{
    Path                  = 'CN=LostAndFoundConfig,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=LostAndFoundConfig,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=LostAndFoundConfig,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=LostAndFoundConfig,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=NTDS Quotas,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=NTDS Quotas,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Subnodes