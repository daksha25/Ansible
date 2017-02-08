#!powershell
# WANT_JSON
# POWERSHELL_COMMON
$ErrorActionPreference = "Stop"
$params = Parse-Args $args
$no1=ansibleParam -obj $params -name "val1" -failifempty $true
$no2=ansibleParam -obj $params -name "val2" -failifempty $true
$no3=ansibleParam -obj $params -name "val3" -failifempty $true
 
$result = New-Object psobject @{
     changed = $FALSE
 }
 try
 {  

    if($no3 -eq "Addition")
    {
    
    $val4 = [int]$no1+[int]$no2
    Write-Host $val4
    $result.changed=$TRUE
    }
    elseif($no3 -eq "Sub")
    {
    
    $val5 = [int]$no1-[int]$no2
    Write-Host $val5
     $result.changed=$TRUE

    }
    elseif($no3 -eq "Mul")
    {
     
    $val6 = [int]$no1*[int]$no2
     Write-Host $val6
     $result.changed=$TRUE

    }
   elseif($no3 -eq "div")
    {
    
    $val7 = [int]$no1/[int]$no2
        Write-Host $val7
        $result.changed=$TRUE

    }
    else
    {
    Write-Host "not a correct choice"
    }   
    }

catch{
 Fail-Json $result $_.Exception.Message
 }
 Exit-Json $result
