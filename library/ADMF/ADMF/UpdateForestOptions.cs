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

        Default = Sites | Subnets | SiteLinks | NTAuthStore,
        All = Sites | Subnets | SiteLinks | ServerRelocate | Schema | SchemaLdif | NTAuthStore | ForestLevel | ExchangeSchema | SchemaDefaultPermissions,
        Topology = Sites | Subnets | SiteLinks,
        AllSchema = Schema | SchemaLdif | ExchangeSchema | SchemaDefaultPermissions
    }
}