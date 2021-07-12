Register-PSFConfigValidation -Name "DCSelectionMode" -ScriptBlock {
	Param (
		$Value
	)
	
	$Result = New-Object PSObject -Property @{
		Success = $True
		Value = $null
		Message = ""
	}
    $legalModes = @(
        'Random'
        'PDCEmulator'
        'Site'
    )
	
	if ($Value -notin $legalModes) {
		$Result.Message = "Bad value: $Value is not any of '$($legalModes -join ",")'"
		$Result.Success = $False
		return $Result
	}
	
	$Result.Value = $number -as [string]
	
	return $Result
}