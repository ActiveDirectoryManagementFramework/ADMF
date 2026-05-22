@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = '%RootDomainSID%-518'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Manage-Topology'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Synchronize'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-In-Filtered-Set'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-All'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Synchronize'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Manage-Topology'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-In-Filtered-Set'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-All'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-In-Filtered-Set'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'DS-Replication-Get-Changes-All'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = '%RootDomainSID%-518'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Change-Schema-Master'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = '%SchemaDN%'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}