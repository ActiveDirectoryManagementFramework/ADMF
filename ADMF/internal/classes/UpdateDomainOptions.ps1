[Flags()] enum UpdateDomainOptions
{
    # Single Values
    AccessRule = 1
    Acl = 2
    GPLink = 4
    GPPermission = 8
    GroupPolicy = 16
    GroupMembership = 32
    Group = 64
    OUSoft = 128
    OUHard = 256
    PSO = 512
    User = 1024
    GPLinkDisable = 2048
    GroupPolicyDelete = 4096
    Object = 8192

    # Multi-valued
    AllGP = 6172
    Security = 515
    AllLinks = 2607
    AllContent = 9696
    Default = 16382
    All = 16383
}