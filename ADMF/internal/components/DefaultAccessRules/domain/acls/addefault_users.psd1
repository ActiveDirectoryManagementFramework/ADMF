@{
	Path  = 'CN=Guest,CN=Users,%DomainDN%'
	Owner = 'S-1-5-32-544'
}
@{
	Path     = 'CN=DefaultAccount,CN=Users,%DomainDN%'
	Owner    = 'S-1-5-32-544'
	Optional = $true
}
@{
	Path     = 'CN=DnsAdmins,CN=Users,%DomainDN%'
	Owner    = 'S-1-5-18'
	Optional = $true
}
@{
	Path     = 'CN=DnsUpdateProxy,CN=Users,%DomainDN%'
	Owner    = 'S-1-5-18'
	Optional = $true
}