@{
    Path                  = 'CN=RpcServices,CN=System,%DomainDN%'
    ActiveDirectoryRights = "GenericAll"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
    Present               = 'false'
}
@{
    Path                  = 'CN=RpcServices,CN=System,%DomainDN%'
    ActiveDirectoryRights = "CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
}
@{
    Path                  = 'CN=FileLinks,CN=System,%DomainDN%'
    ActiveDirectoryRights = "GenericAll"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
    Present               = 'false'
}
@{
    Path                  = 'CN=FileLinks,CN=System,%DomainDN%'
    ActiveDirectoryRights = "CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
}
@{
    Path                  = 'CN=Default Domain Policy,CN=System,%DomainDN%'
    ActiveDirectoryRights = "GenericAll"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
    Present               = 'false'
}
@{
    Path                  = 'CN=Default Domain Policy,CN=System,%DomainDN%'
    ActiveDirectoryRights = "CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
}
@{
    Path                  = 'CN=File Replication Service,CN=System,%DomainDN%'
    ActiveDirectoryRights = "GenericAll"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
    Present               = 'false'
}
@{
    Path                  = 'CN=File Replication Service,CN=System,%DomainDN%'
    ActiveDirectoryRights = "CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
}
@{
    Path                  = 'CN=Dfs-Configuration,CN=System,%DomainDN%'
    ActiveDirectoryRights = "GenericAll"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
    Present               = 'false'
}
@{
    Path                  = 'CN=Dfs-Configuration,CN=System,%DomainDN%'
    ActiveDirectoryRights = "CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
}
@{
    Path                  = 'CN=Password Settings Container,CN=System,%DomainDN%'
    ActiveDirectoryRights = "GenericAll"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
    Present               = 'false'
}
@{
    Path                  = 'CN=Password Settings Container,CN=System,%DomainDN%'
    ActiveDirectoryRights = "CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner"
    InheritanceType       = "None"
    ObjectType            = "<All>"
    InheritedObjectType   = "<All>"
    AccessControlType     = "Allow"
    Identity              = "%DomainSID%-512"
}
@{
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, Delete, GenericRead, WriteDacl, WriteOwner'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=VolumeTable,CN=FileLinks,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = 'S-1-5-32-544'
    InheritanceType       = 'All'
}
@{
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=VolumeTable,CN=FileLinks,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-512'
    InheritanceType       = 'None'
}
@{
    ActiveDirectoryRights = 'GenericAll'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=VolumeTable,CN=FileLinks,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-519'
    InheritanceType       = 'All'
}
@{
    Identity              = 'S-1-5-11'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=VolumeTable,CN=FileLinks,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericRead'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'False'
    ObjectType            = '<All>'
}
@{
    Identity              = '%DomainSID%-512'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=VolumeTable,CN=FileLinks,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'False'
    ObjectType            = '<All>'
}
@{
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=ObjectMoveTable,CN=FileLinks,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-512'
    InheritanceType       = 'None'
}
@{
    Identity              = '%DomainSID%-512'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=ObjectMoveTable,CN=FileLinks,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'False'
    ObjectType            = '<All>'
}

@{
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=AppCategories,CN=Default Domain Policy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-512'
    InheritanceType       = 'None'
}
@{
    Identity              = '%DomainSID%-512'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=AppCategories,CN=Default Domain Policy,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    ActiveDirectoryRights = 'GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=RAS and IAS Servers Access Check,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = 'S-1-5-32-554'
    InheritanceType       = 'None'
}
@{
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, Delete, GenericRead, WriteDacl, WriteOwner'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=RAS and IAS Servers Access Check,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-553'
    InheritanceType       = 'None'
}
@{
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=RAS and IAS Servers Access Check,CN=System,%DomainDN%'
    Present               = 'false'
}
@{
    Identity              = 'S-1-5-11'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=RAS and IAS Servers Access Check,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericRead'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    Identity              = 'S-1-5-18'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=RAS and IAS Servers Access Check,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    ActiveDirectoryRights = 'GenericAll'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = 'S-1-5-18'
    InheritanceType       = 'All'
}
@{
    ActiveDirectoryRights = 'GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = 'S-1-5-20'
    InheritanceType       = 'All'
}
@{
    ActiveDirectoryRights = 'GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-498'
    InheritanceType       = 'All'
}
@{
    ActiveDirectoryRights = 'GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-515'
    InheritanceType       = 'All'
}
@{
    ActiveDirectoryRights = 'GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-520'
    InheritanceType       = 'All'
}
@{
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    AccessControlType     = 'Allow'
    InheritanceType       = 'All'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
}
@{
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
    Present               = 'false'
}
@{
    Identity              = 'S-1-5-11'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericRead'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    Identity              = 'S-1-5-18'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=IP Security,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    ActiveDirectoryRights = 'GenericAll'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = 'S-1-3-0'
    InheritanceType       = 'Descendents'
}
@{
    ActiveDirectoryRights = 'GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = 'S-1-5-11'
    InheritanceType       = 'All'
}
@{
    ActiveDirectoryRights = 'GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = 'S-1-5-18'
    InheritanceType       = 'All'
}
@{
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = 'S-1-5-32-544'
    InheritanceType       = 'None'
}
@{
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
}
@{
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    Present               = 'false'
}
@{
    ActiveDirectoryRights = 'GenericAll'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-519'
    InheritanceType       = 'All'
}
@{
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, GenericRead'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-520'
    InheritanceType       = 'None'
}
@{
    Identity              = 'S-1-5-11'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericRead'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    Identity              = 'S-1-5-18'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIPolicy,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=PolicyTemplate,CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-512'
    InheritanceType       = 'None'
}
@{
    ActiveDirectoryRights = 'CreateChild'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=PolicyTemplate,CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-520'
    InheritanceType       = 'None'
}
@{
    Identity              = '%DomainSID%-512'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=PolicyTemplate,CN=WMIPolicy,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=PolicyType,CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-512'
    InheritanceType       = 'None'
}
@{
    ActiveDirectoryRights = 'CreateChild'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=PolicyType,CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-520'
    InheritanceType       = 'None'
}
@{
    Identity              = '%DomainSID%-512'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=PolicyType,CN=WMIPolicy,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIGPO,CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-512'
    InheritanceType       = 'None'
}
@{
    ActiveDirectoryRights = 'CreateChild'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIGPO,CN=WMIPolicy,CN=System,%DomainDN%'
    AccessControlType     = 'Allow'
    Identity              = '%DomainSID%-520'
    InheritanceType       = 'None'
}
@{
    Identity              = '%DomainSID%-512'
    InheritedObjectType   = '<All>'
    Path                  = 'CN=WMIGPO,CN=WMIPolicy,CN=System,%DomainDN%'
    ActiveDirectoryRights = 'GenericAll'
    AccessControlType     = 'Allow'
    InheritanceType       = 'None'
    Present               = 'false'
    ObjectType            = '<All>'
}
@{
    Path                  = 'CN=WinsockServices,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=WinsockServices,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Meetings,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Meetings,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=ComPartitions,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ComPartitions,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=ComPartitionSets,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ComPartitionSets,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=DomainUpdates,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainUpdates,CN=System,%DomainDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=MicrosoftDNS,CN=System,%DomainDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren, ReadProperty, DeleteTree, ExtendedRight, Delete, GenericWrite, WriteDacl, WriteOwner'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=MicrosoftDNS,CN=System,%DomainDN%'
    Identity              = '%DomainNetBIOSName%\DnsAdmins'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren, ReadProperty, DeleteTree, ExtendedRight, Delete, GenericWrite, WriteDacl, WriteOwner'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=MicrosoftDNS,CN=System,%DomainDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'DC=RootDNSServers,CN=MicrosoftDNS,CN=System,%DomainDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, ListChildren, ReadProperty, DeleteTree, ExtendedRight, Delete, GenericWrite, WriteDacl, WriteOwner'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'DC=RootDNSServers,CN=MicrosoftDNS,CN=System,%DomainDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'DC=RootDNSServers,CN=MicrosoftDNS,CN=System,%DomainDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'CreateChild'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}