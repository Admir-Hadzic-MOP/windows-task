# Script for configuring DC.
# Run it twice, once after server provisions and again after reboot

$newName            = "dc1"
$domainName         = "addomain.moptest.com"
$domainNetbiosName  = "MOP"

if ($env:COMPUTERNAME -ne $newName) {
    Rename-Computer -NewName $newName -Force
    Restart-Computer
}

Install-WindowsFeature AD-domain-services -IncludeManagementTools
Install-ADDSForest -DomainName $domainName -DomainNetbiosName $domainNetbiosName -InstallDNS
