# choco-recipe 

This repository contains a script to install the applications I need to install an AX2012 Development environment.

You must open PowerShell in administrator mode and run the following command: 


## Management tools
```powershell
Install-windowsfeature -name AD-Domain-Services –IncludeManagementTools
```


## Visual Studio 2013 Reboot.
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/troyarrandale/choco-recipe/master/InstallVS2013.ps1'))
```

## AX Pre Requisites
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/troyarrandale/choco-recipe/master/InstallAXPreReq.ps1'))
```

