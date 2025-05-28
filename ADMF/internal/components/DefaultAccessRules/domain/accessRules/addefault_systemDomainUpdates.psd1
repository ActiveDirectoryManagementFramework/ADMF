@{
    ObjectCategory        = 'systemDomainUpdates'
    ActiveDirectoryRights = "GenericAll"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
    Present               = 'false'
}
@{
    ObjectCategory        = 'systemDomainUpdates'
    ActiveDirectoryRights = "CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
    Present               = 'undefined'
}