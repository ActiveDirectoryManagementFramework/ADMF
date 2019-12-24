[Flags()] enum UpdateForestOptions
{
    # Single Values
    Sites = 1
    Subnets = 2
    SiteLinks = 4
    ServerRelocate = 8
    Schema = 16
    SchemaLdif = 32
    
    # Compound 
    Default = 7
    All = 63
    SiteTopology = 7
    AllSchema = 48
}