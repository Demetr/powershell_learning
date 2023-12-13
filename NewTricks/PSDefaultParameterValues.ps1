$PSDefaultParameterValues.Clear()   # removes all existing default parameter values in hash-table $PSDefaultParameterValues
# to disable $PSDefaultParameterValues['Disabled'] = $true; All previously added key/value pairs still exist but the functionality has simply been disabled
$PSDefaultParameterValues.Add("Invoke-Command:Port", 5986)
$PSDefaultParameterValues.Add("Invoke-Command:UseSSL", $true)
