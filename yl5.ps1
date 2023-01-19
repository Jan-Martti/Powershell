#minukommentaar
cls
Write-Host
Write-Host 'Jan it22'
Get-Date -Format 'd.M.y'
Write-Host "Aasta lõpuni jäänud" (New-TimeSpan 2022.12.31).Days "Päeva `n"






"***************************************"
$a = hostname
"Arvuti nimi: "+ $a
"***************************************"
(Get-WMIObject win32_operatingsystem).Caption
"***************************************"
(Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet).IPAddress
"***************************************"
(systeminfo | Select-String 'Total Physical Memory:').ToString().Split(':')[1].Trim()
"***************************************"
(Get-WMIObject win32_Processor).Name
"***************************************"
(Get-WmiObject win32_VideoController).name
"***************************************"
[System.Security.Principal.WindowsIdentity]::GetCurrent().Name
"***************************************"

