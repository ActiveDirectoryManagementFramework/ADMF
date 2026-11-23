@{
    Owner = "S-1-5-32-544"
    Path  = "CN=BuiltIn,%DomainDN%"
}
@{
    Owner = "%DomainSID%-512"
    Path  = "CN=Computers,%DomainDN%"
}
@{
    Owner         = "%DomainSID%-512"
    Path          = "CN=Keys,%DomainDN%"
    NoInheritance = $true
}
@{
    Owner = "%DomainSID%-512"
    Path  = "CN=System,%DomainDN%"
}
@{
    Owner = "%DomainSID%-512"
    Path  = "CN=Users,%DomainDN%"
}