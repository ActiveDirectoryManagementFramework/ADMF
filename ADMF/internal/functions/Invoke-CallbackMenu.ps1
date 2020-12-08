function Invoke-CallbackMenu
{
	<#
	.SYNOPSIS
		Calls a GUI window to pick the contexts for a specific server.
	
	.DESCRIPTION
		Calls a GUI window to pick the contexts for a specific server.
		This is used when invoking Set-AdmfContext with the (hidden) -Callback parameter.
		It is designed to be triggered automatically when trying to manage a forest / domain
		that has not yet had its context defined.

		Note: This makes it critical to define a context first when doing unattended automation.
	
	.PARAMETER Server
		The server / domain being connected to.
		Used for documentation purposes, as well as to potentially determine initial checkbox state.
	
	.PARAMETER Credential
		The credentials to use for this operation.
	
	.EXAMPLE
		PS C:\> Invoke-CallbackMenu -Server contoso.com

		Shows the context selection menu for the domain contoso.com
	#>
	[Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseShouldProcessForStateChangingFunctions", "")]
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[string]
		$Server,
		
		[pscredential]
		$Credential
	)
	
	begin
	{
		#region Utility Functions
		function New-CheckBox
		{
			[CmdletBinding()]
			param (
				$ContextObject,
				
				$Parent
			)
			
			$column = $Parent.Controls.Count % 2
			$row = [math]::Truncate(($Parent.Controls.Count / 2))
			
			$checkbox = [System.Windows.Forms.CheckBox]::new()
			$checkbox.Width = 200
			$checkbox.Height = 20
			$checkbox.AutoSize = $false
			$checkbox.Location = [System.Drawing.Point]::new((210 * $column + 15), (25 * $row + 15))
			$checkbox.Text = $ContextObject.Name
			$checkbox.Font = 'Microsoft Sans Serif,10'
			$null = $Parent.Controls.Add($checkbox)
			$tooltip = [System.Windows.Forms.ToolTip]::new()
			$tooltip.ToolTipTitle = $ContextObject.Name
			$tooltipText = $ContextObject.Description
			if ($ContextObject.Prerequisites.Count -gt 0) { $tooltipText += "`nPrerequisites: $($ContextObject.Prerequisites -join ', ')" }
			if ($ContextObject.MutuallyExclusive.Count -gt 0) { $tooltipText += "`nMutually exclusive with: $($ContextObject.MutuallyExclusive -join ', ')" }
			$tooltip.SetToolTip($checkbox, $tooltipText)
			
			$checkbox.Add_CheckedChanged({ Update-Checkbox })
			
			$checkbox
		}
		
		function Update-Checkbox
		{
			[CmdletBinding()]
			param ()
			
			# Exemption: Accessing superscope variables directly. Forms and their events are screwey enough.
			
			foreach ($checkbox in $contextCheckboxes.Values)
			{
				$checkbox.Enabled = $true
			}
			foreach ($contextObject in $allContexts)
			{
				foreach ($prerequisite in $contextObject.Prerequisites)
				{
					if (-not $contextCheckboxes[$prerequisite].Checked)
					{
						$contextCheckboxes[$contextObject.Name].Enabled = $false
						$contextCheckboxes[$contextObject.Name].Checked = $false
						break
					}
				}
				foreach ($exclusion in $contextObject.MutuallyExclusive)
				{
					if (-not $contextCheckboxes[$contextObject.Name].Checked) { break }
					if (-not $contextCheckboxes[$exclusion]) { continue }
					
					$contextCheckboxes[$exclusion].Enabled = $false
					$contextCheckboxes[$exclusion].Checked = $false
				}
			}
		}
		
		function New-Form
		{
			[OutputType([System.Windows.Forms.Form])]
			[CmdletBinding()]
			param ()
			
			New-Object System.Windows.Forms.Form -Property @{
				ClientSize = '500,500'
				Text	   = "Context Selection"
				TopMost    = $false
				AutoSize   = $false
			}
		}
		
		function New-GroupBox
		{
			[OutputType([System.Windows.Forms.Groupbox])]
			[CmdletBinding()]
			param (
				[string]
				$Text,
				
				[int]
				$Height,
				
				$Form
			)
			
			$newHeight = 10
			if ($Form.Controls.Count -gt 0)
			{
				$last = $Form.Controls | Sort-Object { $_.Location.Y } -Descending | Select-Object -First 1
				$newHeight = 10 + $last.Height + $last.Location.Y
			}
			
			$groupBox = New-Object System.Windows.Forms.Groupbox -Property @{
				Height   = $Height
				Width    = 480
				Text	 = $Text
				AutoSize = $false
				Location = (New-Object System.Drawing.Point(10, $newHeight))
			}
			$Form.Controls.Add($groupBox)
			$groupBox
		}
		
		function New-Label
		{
			[CmdletBinding()]
			param (
				[string]
				$Text,
				
				$Parent
			)
			
			$label = New-Object system.Windows.Forms.Label -Property @{
				Text	 = $Text
				AutoSize = $false
				Font	 = 'Microsoft Sans Serif,10'
				Location = (New-Object System.Drawing.Point(10, 15))
				Width    = 460
				TextAlign = 'MiddleCenter'
			}
			
			$Parent.Controls.Add($label)
		}
		#endregion Utility Functions
		
		$parameters = $PSBoundParameters | ConvertTo-PSFHashtable -Include Server, Credential
		
		#region Form
		[System.Windows.Forms.Application]::EnableVisualStyles()
		
		$form = New-Form
		$group_Server = New-GroupBox -Text "Selected Domain / Server" -Height 50 -Form $form
		try
		{
			$domain = Get-ADDomain @parameters -ErrorAction Stop
			New-Label -Text $domain.DNSRoot -Parent $group_Server
		}
		catch { New-Label -Text $Server -Parent $group_Server }
		
		#region Contexts
		$allContexts = Get-AdmfContext
		$groupedContexts = $allContexts | Group-Object Group
		$contextCheckboxes = @{ }
		foreach ($groupedContext in $groupedContexts)
		{
			$rows = [math]::Round(($groupedContext.Group.Count / 2), [System.MidpointRounding]::AwayFromZero)
			$group_Context = New-GroupBox -Text $groupedContext.Name -Height ($rows * 25 + 15) -Form $form
			foreach ($contextObject in ($groupedContext.Group | Sort-Object Name))
			{
				$contextCheckboxes[$contextObject.Name] = New-CheckBox -ContextObject $contextObject -Parent $group_Context
			}
		}
		
		if ($parameters.Server -eq '<Default Domain>') { $parameters.Server = $env:USERDNSDOMAIN }
		foreach ($context in $allContexts | Sort-Object Weight)
		{
			$path = Join-Path $context.Path 'contextPromptChecked.ps1'
			if (Test-Path $path)
			{
				try
				{
					$result = & $path @parameters
					if ($result) { $contextCheckboxes[$context.Name].Checked = $true }
				}
				catch { Write-PSFMessage -Level Warning -String 'Invoke-CallbackMenu.Context.Checked.Error' -StringValues $context.Name -ErrorRecord $_ }
			}
		}
		
		Update-Checkbox
		#endregion Contexts
		
		#region Buttons
		$button_Cancel = New-Object system.Windows.Forms.Button -Property @{
			Text = 'Cancel'
			Width = 60
			Height = 30
			Anchor = 'right,bottom'
			Location = (New-Object System.Drawing.Point(426, 460))
			Font = 'Microsoft Sans Serif,10'
		}
		$form.Controls.Add($button_Cancel)
		$button_OK = New-Object system.Windows.Forms.Button -Property @{
			Text	 = 'OK'
			Width    = 38
			Height   = 30
			Anchor   = 'right,bottom'
			Location = (New-Object System.Drawing.Point(378, 460))
			Font	 = 'Microsoft Sans Serif,10'
		}
		$form.Controls.Add($button_OK)
		#endregion Buttons
		
		#region Other Stuff
		$okbox = [System.Windows.Forms.CheckBox]::new()
		$okbox.Visible = $false
		$form.Controls.Add($okbox)
		
		$button_OK.Add_Click({
				$okbox.Checked = $true
				$this.Parent.Close()
			})
		$form.ShowIcon = $false
		$form.CancelButton = $button_Cancel
		$form.AcceptButton = $button_OK
		
		$last = $form.Controls | Where-Object { $_ -is [System.Windows.Forms.Groupbox] } | Sort-Object { $_.Location.Y } -Descending | Select-Object -First 1
		$newHeight = 90 + $last.Height + $last.Location.Y
		$form.Height = $newHeight
		#endregion Other Stuff
		#endregion Form
	}
	process
	{
		$null = $form.ShowDialog()
		if (-not $okbox.Checked) { throw "Interrupting: User cancelled operation" }
		
		$selectedNames = @(($contextCheckboxes.Values | Where-Object Checked).Text)
		$allContexts | Where-Object Name -In $selectedNames
	}
}
