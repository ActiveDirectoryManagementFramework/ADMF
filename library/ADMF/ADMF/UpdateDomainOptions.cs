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

        AllGP = GPLink | GPPermission | GroupPolicy | GPLinkDisable | GroupPolicyDelete,
        Security = AccessRule | Acl | PSO,
        AllLinks = AccessRule | Acl | GPLink | GPPermission | GroupMembership | PSO | GPLinkDisable,
        AllContent = GroupMembership | Group | OUSoft | OUHard | User | Group,
        Default = Acl | GPLink | GPPermission | GroupPolicy | GroupMembership | Group | OUSoft | OUHard | PSO | User | GPLinkDisable | GroupPolicyDelete | Object,
        All = AccessRule | Default
    }
}
