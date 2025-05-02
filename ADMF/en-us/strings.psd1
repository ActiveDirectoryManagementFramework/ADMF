# This is where the strings go, that are written by
# Write-PSFMessage, Stop-PSFFunction or the PSFramework validation scriptblocks
@{
	'Invoke-AdmfDC.Executing.Invoke'                        = 'Performing updates to <c="em">{0}</c> against <c="sub">{1}</c>' # 'Shares', $parameters.Server
	'Invoke-AdmfDC.Skipping.Test.NoConfiguration'           = 'Skipping updates to <c="em">{0}</c> as there is no configuration data available' # 'Shares'
	
	'Invoke-AdmfDomain.Executing.Invoke'                    = 'Performing updates to <c="em">{0}</c> against <c="sub">{1}</c>' # 'OrganizationalUnits - Create & Modify', $parameters.Server
	'Invoke-AdmfDomain.Skipping.Test.NoConfiguration'       = 'Skipping updates to <c="em">{0}</c> as there is no configuration data available' # 'OrganizationalUnits - Create & Modify'
	
	'Invoke-AdmfForest.Executing.Invoke'                    = 'Performing updates to <c="em">{0}</c> against <c="sub">{1}</c>' # 'Sites', $parameters.Server
	'Invoke-AdmfForest.Skipping.Test.NoConfiguration'       = 'Skipping updates to <c="em">{0}</c> as there is no configuration data available' # 'Sites'
	
	'Invoke-AdmfItem.Error.BadInput'                        = 'Invalid input: {0} - Provide objects generated from Test-Admf* commands.' # $result
	'Invoke-AdmfItem.Error.Execute'                         = 'Error processing test results against {0} ({1} total items)' # $resultGroup.Name, $resultGroup.Count
	'Invoke-AdmfItem.Error.PostCredentialProvider'          = 'Error executing the post script of the credential provider {0} against {1} ({2} total items)' # $CredentialProvider, $resultGroup.Name, $resultGroup.Count
	'Invoke-AdmfItem.Error.PrepareContext'                  = 'Error preparing context for {0} ({1} total items)' # $resultGroup.Name, $resultGroup.Count
	'Invoke-AdmfItem.Processing'                            = '[{0}] Processing {1}, performing "{2}" against "{3}"' # $resultItem.Server, $resultItem.ObjectType, $resultItem.Type, $resultItem.Identity
	'Invoke-AdmfItem.Processing.ShouldProcess'              = '[{0}] Processing {1}, performing "{2}" against "{3}"' # $resultItem.Server, $resultItem.ObjectType, $resultItem.Type, $resultItem.Identity
	
	'Invoke-CallbackMenu.Context.Checked.Error'             = 'Unexpected error when checking whether context {0} should be checked by default' # $context.Name
	
	'Invoke-PostCredentialProvider.Provider.ExecutionError' = 'An error happened when executing the post-script of credential provider {0}' # $ProviderName
	'Invoke-PostCredentialProvider.Provider.NotFound'       = 'Credential Provider {0} could not be found!' # $ProviderName
	
	'Invoke-PreCredentialProvider.Provider.ExecutionError'  = 'An error happened when executing the pre-script of credential provider {0}' # $ProviderName
	'Invoke-PreCredentialProvider.Provider.NotFound'        = 'Credential Provider {0} could not be found!' # $ProviderName
	
	'New-AdmfContext.Context.AlreadyExists'                 = 'The context {1} already exists in the desginated path {0}. Use -Force to overwrite it, deleting all previous content.' # $resolvedPath, $Name
	'New-AdmfContext.Context.AlreadyExists2'                = 'The context {1} already exists in the desginated context store "{0}". Use -Force to overwrite it, deleting all previous content.' # $Store, $Name
	
	'Resolve-DomainController.Connecting'                   = 'Resolving domain controller to use for connecting to {0}' # $targetString
	'Resolve-DomainController.Resolved'                     = 'Resolved domain controller to use. Operating against {0}' # $domainController.HostName
	
	'Set-AdmfContext.Context.Ambiguous'                     = 'Ambiguous context resolution for {0}. The following contexts would match: {1}' # $contextObject, ($foundContext.Name -join ", ")
	'Set-AdmfContext.Context.Applying'                      = 'Applying context: {0}' # $ContextObject.Name
	'Set-AdmfContext.Context.Error.DCConfig'                = 'Error parsing DC configuration file for context {0}' # $ContextObject.Name
	'Set-AdmfContext.Context.Error.DomainConfig'            = 'Error loading domain configuration | Context: {0} | Object Type: {1} | File: {2}' # $ContextObject.Name, $key, $file.FullName
	'Set-AdmfContext.Context.Error.ForestConfig'            = 'Error loading forest configuration | Context: {0} | Object Type: {1} | File: {2}' # $ContextObject.Name, $key, $file.FullName
	'Set-AdmfContext.Context.Error.PostImport'              = 'Error executing post-import script for context {0}' # $ContextObject.Name
	'Set-AdmfContext.Context.Error.PreImport'               = 'Error executing pre-import script for context {0}' # $ContextObject.Name
	'Set-AdmfContext.Context.InvalidInput'                  = 'Invalid context input: {0} of type {1}. Either provide a name (as string) or a context object returned by Get-AdmfContext' # $contextObject, $contextObject.GetType().FullName
	'Set-AdmfContext.Context.Loading'                       = 'Processing configuration file | Context: {0} | Object Type: {1} | File: {2}' # $ContextObject.Name, $key, $file.FullName
	'Set-AdmfContext.Context.NotFound'                      = 'Unable to find context: {0}' # $contextObject
	'Set-AdmfContext.Domain.AccessError'                    = 'Failed to connect to {0} via ADWS' # $Server
	'Set-AdmfContext.Interactive.Cancel'                    = 'Interactive prompt cancelled by user' # 
	'Set-AdmfContext.Resolution.ExclusionConflict'          = 'Unable to process contexts, as a conflict between contexts has been detected: {0}' # ($conflictingContexts.Name -join ", ")
	'Set-AdmfContext.Resolution.MissingPrerequisites'       = 'Unable to process contexts, as a required prerequisite is missing: {0}' # ($missingPrerequisites -join ", ")
	
	'Test-AdmfDC.Executing.Test'                            = 'Executing tests to verify <c="em">{0}</c> against <c="sub">{1}</c>' # 'Shares', $parameters.Server
	'Test-AdmfDC.Skipping.Test.NoConfiguration'             = 'Skipping tests to verify <c="em">{0}</c> as there is no configuration data available' # 'Shares'
	
	'Test-AdmfDomain.Executing.Test'                        = 'Executing tests to verify <c="em">{0}</c> against <c="sub">{1}</c>' # 'OrganizationalUnits', $parameters.Server
	'Test-AdmfDomain.Skipping.Test.NoConfiguration'         = 'Skipping tests to verify <c="em">{0}</c> as there is no configuration data available' # 'OrganizationalUnits'
	
	'Test-AdmfForest.Executing.Test'                        = 'Executing tests to verify <c="em">{0}</c> against <c="sub">{1}</c>' # 'Sites', $parameters.Server
	'Test-AdmfForest.Skipping.Test.NoConfiguration'         = 'Skipping tests to verify <c="em">{0}</c> as there is no configuration data available' # 'Sites'
	
	'Validate.ContextStore.ExistsNot'                       = 'Context store already exists: {0}' # <user input>, <validation item>
	'Validate.Path'                                         = 'Path does not exist: {0}' # <user input>, <validation item>
	'Validate.Path.Folder'                                  = 'Path does not exist or is not a folder: {0}' # <user input>, <validation item>
	'Validate.Pattern.ContextName'                          = 'Not a legal context name: {0}. Only use letters, numbers, underscore, dot or dash' # <user input>, <validation item>
	'Validate.Pattern.ContextStoreName'                     = 'Not a legal context store name: {0}. Only use letters, numbers, underscore, dot or dash' # <user input>, <validation item>
	'Validate.Type.Gpo'                                     = 'Input is not a GPO object: {0}' # <user input>, <validation item>
}