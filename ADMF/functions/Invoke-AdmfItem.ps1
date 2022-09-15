function Invoke-AdmfItem {
	<#
	.SYNOPSIS
		Apply individual changes found by Test-AdmfDc, Test-AdmfDomain or Test-AdmfForest.
	
	.DESCRIPTION
		Apply individual changes found by Test-AdmfDc, Test-AdmfDomain or Test-AdmfForest.
		This allows applying individual changes, irrespective of domain or type.

		While this command accepts from the pipeline, it groups results by server and executes during the end phase.
		This is done to rationalize the application of credential providers, context switching and connection management.
	
	.PARAMETER TestResult
		The test results to apply.
		Output objects of Test-AdmfDc, Test-AdmfDomain or Test-AdmfForest.
	
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.PARAMETER CredentialProvider
		The credential provider to use to resolve the input credentials.
		See help on Register-AdmfCredentialProvider for details.
	
	.EXAMPLE
		PS C:\> Test-AdmfDomain -Server contoso.com | Where-Object ObjectType -in User, Group | Where-Object ObjectType -eq Create | Invoke-AdmfItem

		Apply all create actions for all users and groups in contoso.com.
	#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
	[CmdletBinding(SupportsShouldProcess = $true)]
	Param (
		[Parameter(ValueFromPipeline = $true)]
		$TestResult,

		[PSCredential]
		$Credential,

		[string]
		$CredentialProvider = 'default'
	)
	
	begin {
		#region Functions
		function Invoke-TestResult {
			[CmdletBinding()]
			param(
				$TestResult,

				$Parameters
			)

			switch ($TestResult.ObjectType) {
				# DCManagement
				'Share' { $TestResult | Invoke-DCShare @Parameters }
				'FSAccessRule' { $TestResult | Invoke-DCAccessRule @Parameters }

				# DomainManagement
				'AccessRule' { $TestResult | Invoke-DMAccessRule @Parameters }
				'Acl' { $TestResult | Invoke-DMAcl @Parameters }
				'DomainLevel' { $TestResult | Invoke-DMDomainLevel @Parameters }
				'ExchangeVersion' { $TestResult | Invoke-DMExchange @Parameters }
				'GPLink' { $TestResult | Invoke-DMGPLink @Parameters }
				'GPOwner' { $TestResult | Invoke-DMGPOwner @Parameters }
				'GPPermission' { $TestResult | Invoke-DMGPPermission @Parameters }
				'GroupMembership' { $TestResult | Invoke-DMGroupMembership @Parameters }
				'GroupPolicy' { $TestResult | Invoke-DMGroupPolicy @Parameters }
				'Group' { $TestResult | Invoke-DMGroup @Parameters }
				'Object' { $TestResult | Invoke-DMObject @Parameters }
				'OrganizationalUnit' { $TestResult | Invoke-DMOrganizationalUnit @Parameters -Delete }
				'PSO' { $TestResult | Invoke-DMPasswordPolicy @Parameters }
				'ServiceAccount' { $TestResult | Invoke-DMServiceAccount @Parameters }
				'User' { $TestResult | Invoke-DMUser @Parameters }

				# ForestManagement
				'Certificate' { $TestResult | Invoke-FMCertificate @Parameters }
				'ExchangeSchema' { $TestResult | Invoke-FMExchangeSchema @Parameters }
				'ForestLevel' { $TestResult | Invoke-FMForestLevel @Parameters }
				'NTAuthStore' { $TestResult | Invoke-FMNTAuthStore @Parameters }
				'Schema' { $TestResult | Invoke-FMSchema @Parameters }
				'SchemaDefaultPermission' { $TestResult | Invoke-FMSchemaDefaultPermission @Parameters }
				'SchemaLdif' { $TestResult | Invoke-FMSchemaLdif @Parameters }
				'Server' { $TestResult | Invoke-FMServer @Parameters }
				'SiteLink' { $TestResult | Invoke-FMSiteLink @Parameters }
				'Site' { $TestResult | Invoke-FMSite @Parameters }
				'Subnet' { $TestResult | Invoke-FMSubnet @Parameters }
			}
		}
		#endregion Functions

		$testResults = [System.Collections.Generic.List[object]]::new()
	}
	process {
		foreach ($result in $TestResult) {
			$hasName = $result.PSObject.TypeNames -match '^DomainManagement|^ForestManagement|^DCManagement'
			if (-not $hasName) {
				Write-PSFMessage -Level Warning -String 'Invoke-AdmfItem.Error.BadInput' -StringValues $result -Target $result
				continue
			}
			$testResults.Add($result)
		}
	}
	end {
		$resultGroups = $testResults | Group-Object Server
		foreach ($resultGroup in $resultGroups) {
			#region Prepare Credential Stuff
			Reset-DomainControllerCache

			$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Credential
			$parameters.Server = $resultGroup.Name

			try {
				$originalArgument = Invoke-PreCredentialProvider @parameters -ProviderName $CredentialProvider -Parameter $parameters
				Invoke-PSFCallback -Data $parameters -EnableException $true
				Set-AdmfContext @parameters -Interactive -ReUse -EnableException
			}
			catch {
				Write-PSFMessage -Level Warning -String 'Invoke-AdmfItem.Error.PrepareContext' -StringValues $resultGroup.Name, $resultGroup.Count -Target $resultGroup -ErrorRecord $_ -EnableException $true -PSCmdlet $PSCmdlet
				if ($originalArgument) {
					try { Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential }
					catch { Write-PSFMessage -Level Warning -String 'Invoke-AdmfItem.Error.PostCredentialProvider' -StringValues $CredentialProvider, $resultGroup.Name, $resultGroup.Count -ErrorRecord $_ -Target $resultGroup -PSCmdlet $PSCmdlet }
				}
				continue
			}
			$parameters += $PSBoundParameters | ConvertTo-PSFHashtable -Include WhatIf, Confirm, Verbose, Debug
			$parameters.Server = $resultGroup.Name
			#endregion Prepare Credential Stuff

			#region Execute Test Results
			try {
				foreach ($resultItem in $resultGroup.Group) {
					if (-not (Test-PSFShouldProcess -Target $resultItem -ActionString 'Invoke-AdmfItem.Processing.ShouldProcess' -ActionStringValues $resultItem.Server, $resultItem.ObjectType, $resultItem.Type, $resultItem.Identity -PSCmdlet $PSCmdlet)) {
						continue
					}
					Write-PSFMessage -Level Host -String 'Invoke-AdmfItem.Processing' -Target $resultItem -StringValues $resultItem.Server, $resultItem.ObjectType, $resultItem.Type, $resultItem.Identity -PSCmdlet $PSCmdlet
					Invoke-TestResult -TestResult $resultItem -Parameters $parameters
				}
			}
			#endregion Execute Test Results

			#region Post Processing
			catch {
				Write-PSFMessage -Level Warning -String 'Invoke-AdmfItem.Error.Execute' -StringValues $resultGroup.Name, $resultGroup.Count -Target $resultGroup -ErrorRecord $_ -EnableException $true -PSCmdlet $PSCmdlet
			}
			finally {
				try { Invoke-PostCredentialProvider -ProviderName $CredentialProvider -Server $originalArgument.Server -Credential $originalArgument.Credential }
				catch { Write-PSFMessage -Level Warning -String 'Invoke-AdmfItem.Error.PostCredentialProvider' -StringValues $CredentialProvider, $resultGroup.Name, $resultGroup.Count -ErrorRecord $_ -Target $resultGroup }
			}
			#endregion Post Processing
		}
	}
}
