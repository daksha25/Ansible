#!powershell
# WANT_JSON
# POWERSHELL_COMMON
$ErrorActionPreference = "Stop"
$params = Parse-Args $args
$no1=ansibleParam -obj $params -name "val1" -failifempty $true
$no2=ansibleParam -obj $params -name "val2" -failifempty $true
$result = New-Object psobject @{
     changed = $FALSE
 }
 try
 {
 $val3 = [int]$no1+[int]$no2
 Write-Host "the value is $val3"
$result.changed = $TRUE
 }
 catch{
 Fail-Json $result $_.Exception.Message
 }
 Exit-Json $result
