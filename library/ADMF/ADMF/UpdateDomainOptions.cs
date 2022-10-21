using System;

namespace ADMF
{
    [Flags]
    public enum UpdateDomainOptions
    {
        AccessRule = 1,
        Acl = 2,
        GPLink = 4,
        GPPermission = 8,
        GroupPolicy = 16,
        GroupMembership = 32,
        Group = 64,
        OUSoft = 128,
        OUHard = 256,
        PSO = 512,
        User = 1024,
        GPLinkDisable = 2048,
        GroupPolicyDelete = 4096,
        Object = 8192,
        DomainLevel = 16384,
        ServiceAccount = 32768,
        Exchange = 65536,
        GPOwner = 131072,
        WmiFilter = 262144,

        AllGP = GPLink | GPPermission | GPOwner | GroupPolicy | GPLinkDisable | GroupPolicyDelete | WmiFilter,
        Security = AccessRule | Acl | PSO,
        AllLinks = AccessRule | Acl | GPLink | GPPermission | GroupMembership | PSO | GPLinkDisable,
        AllContent = GroupMembership | Group | OUSoft | OUHard | User | Group | ServiceAccount | Object,
        Default = Acl | PSO | AllGP | AllContent,
        All = AccessRule | DomainLevel | Default
    }
}
