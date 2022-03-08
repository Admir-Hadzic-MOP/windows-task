## Script for configuring WSUS server

#Install required features
Install-WindowsFeature UpdateServices, UpdateServices-WidDB, UpdateServices-UI, FS-FileServer -IncludeManagementTools

# Initial WSUS configuration
New-Item -Path C:\WSUS -ItemType Directory
sl "C:\Program Files\Update Services\Tools"
.\wsusutil.exe postinstall CONTENT_DIR=C:\WSUS

#Create file share for domain users
$SharePath = 'C:\Shares\Company_Share'
New-Item -Path $SharePath -ItemType Directory
New-SmbShare -Name "Company_Share" -Path $SharePath -ChangeAccess "MOP\Domain Users"
