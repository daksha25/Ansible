 $ws= New-Object -ComObject WScript.Shell;
 $s = $ws.CreateShortcut('C:\Users\514740\Desktop\eclipse.lnk'); 
 $S.TargetPath = 'D:\Softwares\eclipse\eclipse.exe' 
 $S.Save()
