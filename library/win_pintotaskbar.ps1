
#!powershell
# WANT_JSON
# POWERSHELL_COMMON
$ErrorActionPreference = "Stop"
$params = Parse-Args $args
$Location_application = ansibleParam -obj $params -name "val1" -failifempty $true
$app_name = ansibleParam -obj $params -name "val2" -failifempty $true

$result = New-Object psobject @{
     changed = $FALSE
 }
 try
 {
   $shell = new-object -com "Shell.Application"
   $folder = $shell.Namespace($Location_application)
$item = $folder.Parsename($app_name)
 $Flag=0 
$verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}

if ($verb -eq $null)
 {
 Write-Host "That action is not currently available on this item" 
 }
 else 
 {

  $verb.DoIt()
 }
 $result.changed=$TRUE
}
catch{
 Fail-Json $result $_.Exception.Message
 }
 Exit-Json $result

