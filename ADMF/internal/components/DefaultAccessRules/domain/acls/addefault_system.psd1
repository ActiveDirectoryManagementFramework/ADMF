@{
	Path          = 'CN=AdminSDHolder,CN=System,%DomainDN%'
	Owner         = '%DomainSID%-512'
	NoInheritance = $True
}
@{
	Path  = 'CN=DFSR-GlobalSettings,CN=System,%DomainDN%'
	Owner = 'S-1-5-18'
}
@{
	Path     = 'CN=MicrosoftDNS,CN=System,%DomainDN%'
	Owner    = 'S-1-5-18'
	Optional = $true
}
@{
	Path  = 'CN=Server,CN=System,%DomainDN%'
	Owner = 'S-1-5-32-544'
}
@{
	Path          = 'CN=SOA-Policies,CN=System,%DomainDN%'
	Owner         = '%RootDomainSID%-519'
	NoInheritance = $True
	Optional      = $true
}
@{
	Path          = 'CN=WMIPolicy,CN=System,%DomainDN%'
	Owner         = '%DomainSID%-512'
	NoInheritance = $True
}
@{
	Path     = 'DC=RootDNSServers,CN=MicrosoftDNS,CN=System,%DomainDN%'
	Owner    = 'S-1-5-18'
	Optional = $true
}
@{
	ObjectCategory = 'DnsNode'
	Owner          = 'S-1-5-18'
}
@{
	Path          = 'CN=SOM,CN=WMIPolicy,CN=System,%DomainDN%'
	Owner         = '%DomainSID%-512'
	NoInheritance = $True
}
@{
	ObjectCategory = 'WMIFilters'
	Owner          = '%DomainSID%-512'
}
@{
	ObjectCategory = 'systemDomainUpdates'
	Owner          = '__DomainAdminsEx__'
}