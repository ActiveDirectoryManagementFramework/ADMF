@{
	Name        = 'ReadOnlyDomainController'
	ObjectClass = 'computer'
	Property    = @('PrimaryGroupID')
	TestScript  = { $args[0].PrimaryGroupID -eq 521 }
	LDAPFilter  = '(&(objectCategory=computer)(primaryGroupID=521))'
}