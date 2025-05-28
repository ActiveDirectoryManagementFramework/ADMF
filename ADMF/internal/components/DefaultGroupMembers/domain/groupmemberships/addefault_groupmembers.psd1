@{
    Group    = '%DomainSID%-512' # Domain Admins
    Name     = '%DomainSID%-500' # Administrator
    ItemType = 'User'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-544' # Administrators
    Name     = '%DomainSID%-512' # Domain Admins
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-544' # Administrators
    Name     = '%RootDomainSID%-519' # Enterprise Admins
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-544' # Administrators
    Name     = '%DomainSID%-500' # Administrator
    ItemType = 'user'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-545' # Users
    Name     = '%DomainSID%-513' # Domain Users
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-545' # Users
    Name     = 'S-1-5-11' # Authenticated Users
    ItemType = 'foreignSecurityPrincipal'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-545' # Users
    Name     = 'S-1-5-4' # NT AUTHORITY\INTERACTIVE
    ItemType = 'foreignSecurityPrincipal'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-546' # Guests
    Name     = '%DomainSID%-514' # Domain Guests
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-546' # Guests
    Name     = '%DomainSID%-501' # Guest
    ItemType = 'user'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-568' # IIS_IUSRS
    Name     = 'S-1-5-17' # NT AUTHORITY\IUSR
    ItemType = 'foreignSecurityPrincipal'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%RootDomainSID%-518' # Schema Admins
    Name     = '%DomainSID%-500' # Administrator
    ItemType = 'user'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%RootDomainSID%-519' # Enterprise Admins
    Name     = '%DomainSID%-500' # Administrator
    ItemType = 'user'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-520' # Group Policy Creator Owners
    Name     = '%DomainSID%-500' # Administrator
    ItemType = 'user'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-554' # Pre-Windows 2000 Compatible Access
    Name     = 'S-1-5-11' # NT AUTHORITY\Authenticated Users
    ItemType = 'foreignSecurityPrincipal'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = 'S-1-5-32-560' # Windows Authorization Access Group
    Name     = 'S-1-5-9' # NT AUTHORITY\ENTERPRISE DOMAIN CONTROLLERS
    ItemType = 'foreignSecurityPrincipal'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-572' # Denied RODC Password Replication Group
    Name     = '%DomainSID%-521' # Read-only Domain Controllers
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-572' # Denied RODC Password Replication Group
    Name     = '%DomainSID%-520' # Group Policy Creator Owners
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-572' # Denied RODC Password Replication Group
    Name     = '%DomainSID%-512' # Domain Admins
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-572' # Denied RODC Password Replication Group
    Name     = '%DomainSID%-517' # Cert Publishers
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-572' # Denied RODC Password Replication Group
    Name     = '%RootDomainSID%-519' # Enterprise Admins
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-572' # Denied RODC Password Replication Group
    Name     = '%RootDomainSID%-518' # Schema Admins
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-572' # Denied RODC Password Replication Group
    Name     = '%DomainSID%-516' # Domain Controllers
    ItemType = 'group'
    Domain   = '%DomainFqdn%'
}
@{
    Group    = '%DomainSID%-572' # Denied RODC Password Replication Group
    Name     = '%DomainSID%-502' # krbtgt
    ItemType = 'user'
    Domain   = '%DomainFqdn%'
}