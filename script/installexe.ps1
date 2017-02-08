#Start-Process -FilePath "D:\Softwares\curl\curl.exe" -ArgumentList '/S /v /qn'
$msiFile = "D:\Jenkins\jenkins.war"

if (!(Test-Path $msiFile)){
    throw "Path to the MSI File $($msiFile) is invalid. Please supply a valid MSI file"
}

$arguments = @(
            "/S"
            "/D=$INSTALLDIR"
        )

Write-Host "Installing $msiFile....."
Write-Host $arguments
$process = java -jar $msiFile --httpPort=9080
if ($process.ExitCode -eq 0){
    Write-Host "$msiFile has been successfully installed"
}
else {
    Write-Host "Installer exit code  $($process.ExitCode) for file  $($msifile)"
}
Exit $($process.ExitCode) 
