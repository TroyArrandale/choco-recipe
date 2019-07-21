<# chocolatey setup #> 
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); 

<# allowing globally confirmation #> 
choco feature enable -n=allowGlobalConfirmation;

#Dev tools

choco install postman -y
choco install -y fiddler  

#Fred has a licence for royal ts, but could install shareware version to start with?
choco install royalts-v5 -y 

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
 

# Dev Virtualisation (Didnt need to enable BIOS on new machine win!)
choco install -y Microsoft-Hyper-V-All --source="'windowsFeatures'"

#AZ powershell install is problematic
#Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
#Install-Module -Force Az

