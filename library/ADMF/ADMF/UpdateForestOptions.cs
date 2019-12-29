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

        Default = Sites | Subnets | SiteLinks,
        All = Sites | Subnets | SiteLinks | ServerRelocate | Schema | SchemaLdif,
        Topology = Sites | Subnets | SiteLinks,
        AllSchema = Schema | SchemaLdif
    }
}