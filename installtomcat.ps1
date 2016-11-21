$arguments = @(
"-nosplash -application org.eclipse.equinox.p2.director -destination D:\Softwares\test\eclipse-java-neon-R-win32\eclipse -repository https://sourceforge.net/projects/tomcatplugin/files/updatesite -installIU net.sf.eclipse.tomcat.feature.feature.group"
)

$process = Start-Process -Verb Runas -FilePath D:\Softwares\test\eclipse-java-neon-R-win32\eclipse\eclipsec.exe -ArgumentList $arguments  -PassThru -Wait
if ($process.ExitCode -eq 0){
    Write-Host "Eclipse m2e-egit and Groovy Related plugins successfully installed"
}
else {
    Write-Host "Installer exit code  $($process.ExitCode) for file $($eclipsePath)"
}
Exit $($process.ExitCode)

