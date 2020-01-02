# Scriptfile that is executed BEFORE the context resources are applied
# Optional, delete file if not needed for performance benefit

param (
	[PSFComputer]
	$Server,
	
	[System.Management.Automation.PSCredential]
	$Credential
)