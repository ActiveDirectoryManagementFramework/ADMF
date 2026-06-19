using System;

namespace ADMF
{
    [Flags]
    public enum UpdateForestOptions
    {
        Sites = 1,
        Subnets = 2,
        SiteLinks = 4,
        ServerRelocate = 8,
        Schema = 16,
        SchemaLdif = 32,
        NTAuthStore = 64,
        ForestLevel = 128,
        ExchangeSchema = 256,
        SchemaDefaultPermissions = 512,
        Certificates = 1024,
        SchemaManage = 2048,
        AccessRule = 4096,
        Acl = 8192,

        Default = Sites | Subnets | SiteLinks | NTAuthStore | Certificates,
        All = Default | ServerRelocate | ForestLevel | AllSchema | AllAccess,
        Topology = Sites | Subnets | SiteLinks,
        AllSchema = Schema | SchemaLdif | ExchangeSchema | SchemaDefaultPermissions,
        AllAccess = AccessRule | Acl
    }
}