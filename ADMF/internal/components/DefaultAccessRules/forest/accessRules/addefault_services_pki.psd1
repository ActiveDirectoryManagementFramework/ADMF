@{
    Path                  = 'CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Enrollment Services,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Enrollment Services,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=Certification Authorities,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Certification Authorities,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=AIA,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-517'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AIA,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=AIA,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=CDP,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=CDP,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=KRA,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=KRA,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=OID,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=OID,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=NTAuthCertificates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=NTAuthCertificates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
#TODO: Review and potentially replace
@{
    Path                  = 'CN=NTAuthCertificates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=NTAuthCertificates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=NTAuthCertificates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=NTAuthCertificates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    Path                  = 'CN=NTAuthCertificates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}

#region Template Standards
#TODO: Update to new DA-selector
@{
    ObjectCategory        = 'cfg_certificateTemplates'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, DeleteTree, Delete, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_certificateTemplates'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, DeleteTree, Delete, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
#TODO: Update to new DA-selector
@{
    ObjectCategory        = 'cfg_certificateTemplates'
    Identity              = '%RootDomainSID%-512'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
#TODO: Review Domain Users
@{
    ObjectCategory        = 'cfg_certificateTemplates'
    Identity              = '%RootDomainSID%-513' # Domain Users
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_certificateTemplates'
    Identity              = '%DomainSID%-513'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_certificateTemplates'
    Identity              = '%RootDomainSID%-519'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_certificateTemplates'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_certificateTemplates'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Template Standards

#region Default Template Overrides
@{
    Path                  = 'CN=User,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-513'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=UserSignature,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-513'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=ClientAuth,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-513'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=EFS,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-513'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Machine,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-515'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainController,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainController,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ReadProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainController,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=IPSECIntermediateOnline,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-515'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=IPSECIntermediateOnline,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainControllerAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainControllerAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainControllerAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ReadProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainControllerAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ReadProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainControllerAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DomainControllerAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DirectoryEmailReplication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DirectoryEmailReplication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DirectoryEmailReplication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ReadProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DirectoryEmailReplication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ReadProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DirectoryEmailReplication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=DirectoryEmailReplication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=Workstation,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-515'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=RASAndIASServer,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-553'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=KerberosAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=KerberosAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = 'S-1-5-9'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=KerberosAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ReadProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=KerberosAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-498'
    ActiveDirectoryRights = 'ReadProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=KerberosAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-AutoEnrollment'
    InheritedObjectType   = '<All>'
}
@{
    Path                  = 'CN=KerberosAuthentication,CN=Certificate Templates,CN=Public Key Services,CN=Services,%ConfigurationDN%'
    Identity              = '%DomainSID%-516'
    ActiveDirectoryRights = 'ReadProperty, WriteProperty, ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
#endregion Default Template Overrides

#region Enrollment Services
@{
    ObjectCategory        = 'cfg_pki_EnrollmentService'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_EnrollmentService'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, DeleteTree, Delete, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_EnrollmentService'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'ExtendedRight'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = 'Certificate-Enrollment'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_EnrollmentService'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_EnrollmentService'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_EnrollmentService'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Enrollment Services

#region Certificate Authority
@{
    ObjectCategory        = 'cfg_pki_certificationAuthority'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_certificationAuthority'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
#TODO: Review & Update
@{
    ObjectCategory        = 'cfg_pki_certificationAuthority'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_certificationAuthority'
    Identity              = '%DomainSID%-517'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_certificationAuthority'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_certificationAuthority'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_certificationAuthority'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_certificationAuthority'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Certificate Authority

#region AIA Authority
@{
    ObjectCategory        = 'cfg_pki_aiaAuthority'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_aiaAuthority'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
#TODO: Review & Update
@{
    ObjectCategory        = 'cfg_pki_aiaAuthority'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_aiaAuthority'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_aiaAuthority'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_aiaAuthority'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_aiaAuthority'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion AIA Authority

#region CDP
@{
    ObjectCategory        = 'cfg_pki_CDP'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_CDP'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
#TODO: Review & Update
@{
    ObjectCategory        = 'cfg_pki_CDP'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_CDP'
    Identity              = '%DomainSID%-517'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_CDP'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_CDP'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'CreateChild, DeleteChild, Self, WriteProperty, ExtendedRight, GenericRead, WriteDacl, WriteOwner'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_CDP'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_CDP'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion CDP

#region CRL Distribution Point
@{
    ObjectCategory        = 'cfg_pki_cRLDistributionPoint'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_cRLDistributionPoint'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
#TODO: Review & Update
@{
    ObjectCategory        = 'cfg_pki_cRLDistributionPoint'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_cRLDistributionPoint'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_cRLDistributionPoint'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_cRLDistributionPoint'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_cRLDistributionPoint'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion CRL Distribution Point

#region Private Key Recovery Agent
@{
    ObjectCategory        = 'cfg_pki_msPKI-PrivateKeyRecoveryAgent'
    Identity              = 'S-1-1-0'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_msPKI-PrivateKeyRecoveryAgent'
    Identity              = 'S-1-5-32-544'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
#TODO: Review & Update
@{
    ObjectCategory        = 'cfg_pki_msPKI-PrivateKeyRecoveryAgent'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_msPKI-PrivateKeyRecoveryAgent'
    Identity              = '%DomainSID%-519'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'All'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
}
@{
    ObjectCategory        = 'cfg_pki_msPKI-PrivateKeyRecoveryAgent'
    Identity              = 'S-1-5-11'
    ActiveDirectoryRights = 'GenericRead'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_msPKI-PrivateKeyRecoveryAgent'
    Identity              = 'S-1-5-18'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
@{
    ObjectCategory        = 'cfg_pki_msPKI-PrivateKeyRecoveryAgent'
    Identity              = '%DomainSID%-512'
    ActiveDirectoryRights = 'GenericAll'
    InheritanceType       = 'None'
    AccessControlType     = 'Allow'
    ObjectType            = '<All>'
    InheritedObjectType   = '<All>'
    Present               = 'false'
}
#endregion Private Key Recovery Agent