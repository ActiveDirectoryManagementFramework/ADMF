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
		Used for documentation purposes only.
	
	.EXAMPLE
		PS C:\> Invoke-CallbackMenu -Server contoso.com

		Shows the context selection menu for the domain contoso.com
	#>
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory = $true)]
		[string]
		$Server
	)
	
	begin
	{
		#region Utility Functions
		function New-CheckBox {
			[CmdletBinding()]
			param (
				[string]
				$Name,
				[int]
				$Height,
				$Parent
			)
			$checkbox = [System.Windows.Forms.CheckBox]::new()
			$checkbox.Width = 200
			$checkbox.Height = 20
			$checkbox.AutoSize = $false
			$checkbox.Location = [System.Drawing.Point]::new(15, $Height)
			$checkbox.Text = $Name
			$checkbox.Font = 'Microsoft Sans Serif,10'
			$null = $Parent.Controls.Add($checkbox)
			$checkbox
		}
		#endregion Utility Functions

		#region Form
		[System.Windows.Forms.Application]::EnableVisualStyles()

		$form_ContextSelection           = New-Object system.Windows.Forms.Form
		$form_ContextSelection.ClientSize  = '400,500'
		$form_ContextSelection.text      = "Context Selection"
		$form_ContextSelection.TopMost   = $false

		#region Group: Server
		$group_Server                    = New-Object system.Windows.Forms.Groupbox
		$group_Server.height             = 50
		$group_Server.width              = 250
		$group_Server.text               = "Selected Domain / Server"
		$group_Server.location           = New-Object System.Drawing.Point(135,10)

		$label_Server                    = New-Object system.Windows.Forms.Label
		$label_Server.text               = $Server
		$label_Server.AutoSize           = $true
		$label_Server.width              = 200
		$label_Server.height             = 20
		$label_Server.location           = New-Object System.Drawing.Point(10,15)
		$label_Server.Font               = 'Microsoft Sans Serif,10'
		#endregion Group: Server

		#region Buttons
		$button_Cancel                   = New-Object system.Windows.Forms.Button
		$button_Cancel.text              = "Cancel"
		$button_Cancel.width             = 60
		$button_Cancel.height            = 30
		$button_Cancel.Anchor            = 'right,bottom'
		$button_Cancel.location          = New-Object System.Drawing.Point(326,460)
		$button_Cancel.Font              = 'Microsoft Sans Serif,10'

		$button_OK                       = New-Object system.Windows.Forms.Button
		$button_OK.text                  = "OK"
		$button_OK.width                 = 38
		$button_OK.height                = 30
		$button_OK.Anchor                = 'right,bottom'
		$button_OK.location              = New-Object System.Drawing.Point(278,460)
		$button_OK.Font                  = 'Microsoft Sans Serif,10'
		#endregion Buttons

		#region Other Stuff
		$okbox = [System.Windows.Forms.CheckBox]::new()
		$okbox.Visible = $false
		$form_ContextSelection.Controls.Add($okbox)

		$group_AdditionalContexts        = New-Object system.Windows.Forms.Groupbox
		$group_AdditionalContexts.height  = 320
		$group_AdditionalContexts.width  = 370
		$group_AdditionalContexts.text   = "Additional Contexts"
		$group_AdditionalContexts.location  = New-Object System.Drawing.Point(15,130)

		$form_ContextSelection.controls.AddRange(@($group_Server,$button_Cancel,$button_OK,$group_AdditionalContexts))
		$group_Server.controls.AddRange(@($label_Server))

		$button_OK.Add_Click({ 
			$okbox.Checked = $true
			$this.Parent.Close()
		})
		$form_ContextSelection.ShowIcon = $false
		$form_ContextSelection.CancelButton = $button_Cancel
		$form_ContextSelection.AcceptButton = $button_OK
		#endregion Other Stuff
		#endregion Form

		$checkBoxes = @{ }
		$height = 20
		foreach ($contextName in (Get-ChildItem -Path "$script:ModuleRoot\internal\contexts" -Directory).Name) {
			$checkBoxes[$contextName] = New-CheckBox -Name $contextName -Height $height -Parent $group_AdditionalContexts
			$height += 25
		}
		$group_AdditionalContexts.height = 5 + $height
		$form_ContextSelection.Height = 220 + $height
	}
	process
	{
		$null = $form_ContextSelection.ShowDialog()
		if (-not $okbox.Checked) { throw "Interrupting: User cancelled operation" }
		
		$selectedContexts = @()
		foreach ($checkbox in $checkBoxes.Values) {
			if ($checkbox.Checked) { $selectedContexts += $checkbox.Text }
		}

		$selectedContexts
	}
}
