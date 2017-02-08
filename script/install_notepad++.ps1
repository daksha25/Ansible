$msiFile = "D:\Softwares\npp.6.6.6.Installer.exe"
if (!(Test-Path $msiFile)){
    throw "Path to the MSI File $($msiFile) is invalid. Please supply a valid MSI file"
}
$InstallDir = "<C:\Program Files\Notepad++>"
$arguments = @(
            "/S"            
            "/D=$INSTALLDIR" 
        )

Write-Host "Installing $msiFile....."
Write-Host $arguments
$process = Start-Process -verb RunAs -FilePath $msiFile -ArgumentList $arguments -PassThru -Wait
if ($process.ExitCode -eq 0){
    Write-Host "$msiFile has been successfully installed"
}
else {
    Write-Host "Installer exit code  $($process.ExitCode) for file  $($msifile)"
}
Exit $($process.ExitCode)
  
