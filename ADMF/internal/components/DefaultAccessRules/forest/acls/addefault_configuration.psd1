@{
    Owner        = '%RootDomainSID%-519'
    DefaultOwner = $true
}
@{
    ObjectCategory = 'crossRef-DNSZone'
    Owner          = 'S-1-5-18' # System
}
@{
    ObjectCategory = 'msDNS-ServerSettings'
    Owner          = 'S-1-5-18' # System
}
@{
    ObjectCategory = 'cfg_ForestUpdateOperations'
    Owner          = '__DomainAdminsEx__'
}
@{
    ObjectCategory = 'cfg_ntdssettings'
    Owner          = '__DomainAdminsEx__'
}
@{
    ObjectCategory = 'cfg_ntdsconnection'
    Owner          = '__DomainAdminsEx__'
}
@{
    ObjectCategory = 'cfg_siteserver'
    Owner          = '__DomainAdminsEx__'
}
@{
    ObjectCategory = 'cfg_certificateTemplates'
    Owner          = '%RootDomainSID%-519'
    NoInheritance  = $true
}