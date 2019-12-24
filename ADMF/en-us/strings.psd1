# This is where the strings go, that are written by
# Write-PSFMessage, Stop-PSFFunction or the PSFramework validation scriptblocks
@{
	'Invoke-AdmfDomain.Executing.Invoke' = 'Performing updates to <c="em">{0}</c> against <c="sub">{1}</c>' # 'OrganizationalUnits - Create & Modify', $parameters.Server

	'Invoke-AdmfForest.Executing.Invoke' = 'Performing updates to <c="em">{0}</c> against <c="sub">{1}</c>' # 'Sites', $parameters.Server
	
	'Resolve-DomainController.Connect.Failed' = 'Failed to connect to {0}' # $Server
	'Resolve-DomainController.Resolved' = 'Resolved domain controller to use. Operating against {0}' # $domainController.HostName
	
	'Test-AdmfDomain.Executing.Test' = 'Executing tests to verify <c="em">{0}</c> against <c="sub">{1}</c>' # 'OrganizationalUnits', $parameters.Server
	
	'Test-AdmfForest.Executing.Test' = 'Executing tests to verify <c="em">{0}</c> against <c="sub">{1}</c>' # 'Sites', $parameters.Server
	
	'Validate.Path' = 'Path does not exist: {0}' # <user input>, <validation item>
	'Validate.Type.Gpo' = 'Input is not a GPO object: {0}' # <user input>, <validation item>	
}