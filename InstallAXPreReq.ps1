<# chocolatey setup #> 
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); 

#Load choclatey so we can use 
Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"

<# allowing globally confirmation #> 
choco feature enable -n=allowGlobalConfirmation;

#to list windows features with choco
#choco list --source windowsFeatures

#Use this all the time for checking open ports
choco install -y TelnetClient --source="'windowsFeatures'" 

# web dev windows features(also ax req)
choco install -y IIS-IIS6ManagementCompatibility --source="'windowsFeatures'"
choco install -y IIS-WebServerRole --source="'windowsFeatures'"
choco install -y IIS-ISAPIFilter --source="'windowsFeatures'"
choco install -y IIS-ISAPIExtensions --source="'windowsFeatures'"
choco install -y IIS-NetFxExtensibility --source="'windowsFeatures'"
choco install -y IIS-ASPNET --source="'windowsFeatures'"

#AX windows features
choco install -y NetFx4Extended-ASPNET45 --source="'windowsFeatures'"
choco install -y WCF-HTTP-Activation      --source="'windowsFeatures'"                
choco install -y WCF-NonHTTP-Activation--source="'windowsFeatures'"
choco install -y IIS-ASPNET          --source="'windowsFeatures'"                  
choco install -y IIS-ASPNET45 --source="'windowsFeatures'"
choco install -y Windows-Identity-Foundation --source="'windowsFeatures'"
choco install -y IIS-RequestFiltering --source="'windowsFeatures'"                   
choco install -y WCF-HTTP-Activation45  --source="'windowsFeatures'"                               
choco install -y WCF-TCP-Activation45    --source="'windowsFeatures'"                            
choco install -y WCF-Pipe-Activation45    --source="'windowsFeatures'"                          
choco install -y WCF-MSMQ-Activation45 --source="'windowsFeatures'"       
choco install -y IIS-WindowsAuthentication --source="'windowsFeatures'"       

#todo need to add SSRS and SSIS etc.
choco install -y sql-server-2017
choco install -y sql-server-management-studio

#Download MS Chart 3.5 
(New-Object System.Net.WebClient).DownloadFile("https://download.microsoft.com/download/c/c/4/cc4dcac6-ea60-4868-a8e0-62a8510aa747/MSChart.exe", "$env:TEMP\MSChart.exe")
# Quitley Install
."$env:TEMP\MSChart.exe" /q


#Open XML SDK for Microsoft Office
(New-Object System.Net.WebClient).DownloadFile("https://download.microsoft.com/download/2/7/F/27FF6744-D970-4FFB-90B8-5226B2B82E0A/OpenXMLSDKv2.msi", "$env:TEMP\OpenXMLSDKv2.msi")

$MSIArguments = @(
    "/i"
    ('"{0}"' -f "$env:TEMP\OpenXMLSDKv2.msi")
    "/qn"
    "/norestart"
)
Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow 



#Open XML for Microsoft Office
(New-Object System.Net.WebClient).DownloadFile("https://download.microsoft.com/download/2/7/F/27FF6744-D970-4FFB-90B8-5226B2B82E0A/OpenXMLSDKTool.msi", "$env:TEMP\OpenXMLSDKTool.msi")

$MSIArguments = @(
    "/i"
    ('"{0}"' -f "$env:TEMP\OpenXMLSDKTool.msi")
    "/qn"
    "/norestart"
)
Start-Process "msiexec.exe" -ArgumentList $MSIArguments -Wait -NoNewWindow 


choco install vcredist2008
choco install vcredist2010
choco install vcredist2012


#not working
choco install mssyncframework21-corecomponents-x64

Install-ChocolateyPackage `
'MSSyncFramework21-sdk-x64' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/E/1/E/E1E636E6-AA5C-4052-9927-D722312DB564/Synchronization-v2.1-x64-ENU.msi' `
-checksum 'C5D8A7340520BE84D394BACBBAF57585D2812D5327856E52AFA3E0E5F230EA50' `
-checksumtype 'SHA256'

Install-ChocolateyPackage `
'Synchronization-v2.1-x86-ENU' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/E/1/E/E1E636E6-AA5C-4052-9927-D722312DB564/Synchronization-v2.1-x86-ENU.msi' `
-checksum '02E12372082331AFC5A805A6A64BBCF3329D07EC1D89030CA31013BE504BE8B6' `
-checksumtype 'SHA256'

Install-ChocolateyPackage `
'DatabaseProviders-v3.1-x64-ENU' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/E/1/E/E1E636E6-AA5C-4052-9927-D722312DB564/DatabaseProviders-v3.1-x64-ENU.msi' `
-checksum 'F060B237C4DF222C9A268BC60E94ABF5B94812B84B4F0D50F2A03301308DFAA6' `
-checksumtype 'SHA256'

Install-ChocolateyPackage `
'DatabaseProviders-v3.1-x86-ENU' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/E/1/E/E1E636E6-AA5C-4052-9927-D722312DB564/DatabaseProviders-v3.1-x86-ENU.msi' `
-checksum '1874E2BBAEF36C9695B02680D98BBDD4424E8263E91AA7C897B88ECE0B446916' `
-checksumtype 'SHA256'

Install-ChocolateyPackage `
'ProviderServices-v2.1-x64-ENU' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/E/1/E/E1E636E6-AA5C-4052-9927-D722312DB564/ProviderServices-v2.1-x64-ENU.msi' `
-checksum 'C689BC2A5E8DB10E9148BD8960FF91F88C7420507C36BDC1F0FA42BA583FBB70' `
-checksumtype 'SHA256'

Install-ChocolateyPackage `
'ProviderServices-v2.1-x86-ENU' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/E/1/E/E1E636E6-AA5C-4052-9927-D722312DB564/ProviderServices-v2.1-x86-ENU.msi' `
-checksum '60244D374EA159C337EA8EBE8E86C04C70B721A3D79557291622EEE53FE52843' `
-checksumtype 'SHA256'

Install-ChocolateyPackage `
'vcredist_x86.exe' 'exe' "/Q /NORESTART" `
'https://download.microsoft.com/download/d/d/9/dd9a82d0-52ef-40db-8dab-795376989c03/vcredist_x86.exe' `
-checksum '41F45A46EE56626FF2699D525BB56A3BB4718C5CA5F4FB5B3B38ADD64584026B' `
-checksumtype 'SHA256'

Install-ChocolateyPackage `
'vcredist_x64.exe' 'exe' "/Q /NORESTART" `
'https://download.microsoft.com/download/2/d/6/2d61c766-107b-409d-8fba-c39e61ca08e8/vcredist_x64.exe' `
-checksum '55BF99AD3F063165C3EE1626787B5D4C2B65B5001FEF79DD58C3490369ED282F' `
-checksumtype 'SHA256'

# Pre Req for report viewer
choco install sql2012.clrtypes

Install-ChocolateyPackage `
'ReportViewer2012' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/F/B/7/FB728406-A1EE-4AB5-9C56-74EB8BDDF2FF/ReportViewer.msi' `
-checksum '948F28452ABDDD90B27DC80ABA1B48C3FAEDCF2BD42254C71B5B1E19AC5C6DAF' `
-checksumtype 'SHA256'


#TODO

#https://download.microsoft.com/download/1/3/0/13089488-91FC-4E22-AD68-5BE58BD5C014/ENU/x64/SQL_AS_ADOMD.msi
#https://download.microsoft.com/download/1/3/0/13089488-91FC-4E22-AD68-5BE58BD5C014/ENU/x86/SQL_AS_ADOMD.msi

# Install box starter and run windows update in an attempt to get KB2703853
# CINST Boxstarter
# BOXSTARTERSHELL
# Install-WindowsUpdate


Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PSWindowsUpdate -RequiredVersion 2.1.0.1 -Confirm:$false -force -AllowClobber
Get-WUInstall -KBArticleID KB2703853

Write-Host "Run windows updates"
Install-Module -Name PSWindowsUpdate -Force -AllowClobber
Get-WUInstall -WindowsUpdate -AcceptAll -UpdateType Software -IgnoreReboot
Get-WUInstall -MicrosoftUpdate -AcceptAll -IgnoreUserInput -IgnoreReboot