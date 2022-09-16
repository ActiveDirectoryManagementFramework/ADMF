@{
    Name = 'VirtualMachineObject'
    ObjectClass = 'serviceConnectionPoint'
    Property = @('Name')
    TestScript = { $args[0].Name -eq 'Windows Virtual Machine' }
    LDAPFilter = '(&(objectCategory=serviceConnectionPoint)(name=Windows Virtual Machine))'
}