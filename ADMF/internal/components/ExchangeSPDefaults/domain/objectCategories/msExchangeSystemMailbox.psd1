@{
	Name        = 'msExchangeSystemMailbox'
	ObjectClass = 'user'
	Property    = 'DistinguishedName'
	TestScript  = { $args[0].DistinguishedName -match '^CN=(SystemMailbox|DiscoverySearchMailbox |Migration\.|FederatedEmail\.)(\{{0,1}([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}\}{0,1}),CN=Users,DC=' }
	LDAPFilter  = '(&(objectCategory=user)(|(name=SystemMailbox*)(name=DiscoverySearchMailbox*|Migration.*|FederatedEmail.*)))'
	SearchBase  = 'CN=Users,%DomainDN%'
}