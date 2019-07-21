# choco-recipe 

<!-- [![Build status](https://ci.appveyor.com/api/projects/status/sli76aallhvlthm1?svg=true)](https://ci.appveyor.com/project/paulalves/choco-install) -->

This repository contains a script to install the applications I need in my daily work. I'm using [Chocolatey](https://chocolatey.org) which is a package manager and allows you install applications easily from the command line, and scripting all turned out to be an obvious and lazy choice.

You must open PowerShell in administrator mode and run the following command: 

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/troyarrandale/choco-recipe/master/InstallAXPreReq.ps1'))
```