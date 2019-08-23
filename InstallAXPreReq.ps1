<# chocolatey setup #> 


# The Prequisties for the following components will be installed:

#       - Databases
#       - Application Object Server (AOS)
#       - Debugger
#       - Management utilities
#       - .NET Business Connector
#       - Client
#       - Retail POS
#       - Retail SDK
#       - Retail Salt Utility
#       - Retail Channel Configuration Utility
#       - Real-time Service
#       - Retail channel database
#       - Visual Studio 2013 Tools
#       - Async Server
#       - Async Client
#       - Data Import/Export Framework (DIXF) service
#       - AOS component
#       - Client component
#       - Trace Parser


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

# Install SQL Server with AX required components, add builtin administrators to group.

$tools = Get-ToolsLocation
New-Item -ItemType Directory -Force -Path $tools
(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/TroyArrandale/choco-recipe/master/SQLServer2017-ConfigurationFile.ini", "$tools\ConfigurationFile.ini")
choco install -y sql-server-2017 -params="/ConfigurationFile:C:\tools\ConfigurationFile.ini"

choco install ssrs --params "Dev"

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


Install-ChocolateyPackage `
'Synchronization-KB2703853-v2.1-x64-ENU.msi' 'msi' "/quiet /norestart" `
'https://raw.githubusercontent.com/TroyArrandale/choco-recipe/master/KB2703853/448521_intl_x64_zip/Synchronization-KB2703853-v2.1-x64-ENU.msi' `
-checksum 'A8E0EE1D5EB7D99FCD80ABB85AF65FFF405138EF5E3CC3B8C119D2D09E660ABA' `
-checksumtype 'SHA256'


Install-ChocolateyPackage `
'DatabaseProviders-KB2703853-v3.1-x64-ENU' 'msi' "/quiet /norestart" `
'https://raw.githubusercontent.com/TroyArrandale/choco-recipe/master/KB2703853/448519_intl_x64_zip/DatabaseProviders-KB2703853-v3.1-x64-ENU.msi' `
-checksum '1E4A271B4933DFEA27C77E85D730D456B7838A0151354019A5FEE4C074303F42' `
-checksumtype 'SHA256'


Install-ChocolateyPackage `
'ProviderServices-KB2703853-v2.1-x64-ENU.msi' 'msi' "/quiet /norestart" `
'https://raw.githubusercontent.com/TroyArrandale/choco-recipe/master/KB2703853/448520_intl_x64_zip/ProviderServices-KB2703853-v2.1-x64-ENU.msi' `
-checksum '0A97A7D7F9D1816009EA083796F895FF97B9B986C100704E99198A3A50B94F8A' `
-checksumtype 'SHA256'

choco install tfs2010objectmodel

choco install visualstudio2013professional

# Install missing KB Explicitly.
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PSWindowsUpdate -RequiredVersion 2.1.0.1 -Confirm:$false -force -AllowClobber
Get-WUInstall -KBArticleID KB2703853

# Update all windows components as above update is flakey
Write-Host "Run windows updates"
Install-Module -Name PSWindowsUpdate -Force -AllowClobber
Get-WUInstall -WindowsUpdate -AcceptAll -UpdateType Software -IgnoreReboot
Get-WUInstall -MicrosoftUpdate -AcceptAll -IgnoreUserInput -IgnoreReboot



#2014 probably can be removed
Install-ChocolateyPackage `
'SQL_AS_ADOMD 2014' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/1/3/0/13089488-91FC-4E22-AD68-5BE58BD5C014/ENU/x64/SQL_AS_ADOMD.msi' `
-checksum 'D7E95DB67D8ECD97DA045D04FBED3C21B4AC889277A5B7EF1483F8CC50F56AC1' `
-checksumtype 'SHA256'

#2014 probably can be removed
Install-ChocolateyPackage `
'SQL_AS_ADO 2014' 'msi' "/quiet /norestart" `
'https://download.microsoft.com/download/1/3/0/13089488-91FC-4E22-AD68-5BE58BD5C014/ENU/x64/SQL_AS_AMO.msi' `
-checksum 'EC80922814E6B0693B2D6FC87C22BA02DC8A77D49620CD1EC5BD8091AB89CA1E' `
-checksumtype 'SHA256'

#2012 is required for bids
Install-ChocolateyPackage `
'SQL_AS_ADO 2012' 'msi' "/quiet /norestart" `
'http://download.microsoft.com/download/F/E/D/FEDB200F-DE2A-46D8-B661-D019DFE9D470/ENU/x64/SQL_AS_AMO.msi' `
-checksum 'DE4E07C3DC2AC6D89FDC52A947521D5F47605171AADE7E29E766F4DCB59696F5' `
-checksumtype 'SHA256'


$DesktopPath = [Environment]::GetFolderPath("Desktop")

# Create a self signed cert for retail components.
$Cert = New-SelfSignedCertificate -DnsName "localhost" -CertStoreLocation "cert:\LocalMachine\My"
$Cert.Thumbprint | Out-File "$DesktopPath\thumbprint.txt"