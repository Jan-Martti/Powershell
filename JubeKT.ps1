#Jan-Martti Olop
#KT 04
#01.19.2023                                                          
#-----------------------------------------------------------# 
# Skript tahab teada kasutajalt faili nime                  #
# Siis skript võtab xml faili sisu                          #
# Skript iga reaga võtab nime muutujasse                    #
# Paska kasutatakse kaustade ja failide loomiseks           #
#-----------------------------------------------------------#

$Skriptitee = $MyInvocation.MyCommand.Path
$dir = Split-Path $Skriptitee

$sisestus = Read-Host "Mis on fail mida tahate avada? (*.xml)"


if ($sisestus -notmatch "$_.xml")
{
    DO
    {
        Write-Host "Error: Valen fail nuub!!!!!!"
        $sisestus = Read-Host "Palun sisestage faili nimi uuesit see eelmine oli vale!!!!!!!"
    }
   Until ($sisestus -match "$_.xml")
}

$xml = [xml](Get-Content $dir\$sisestus)
$rows = $xml.customers.customer

foreach ($row in $rows)
{
    $tnimi = $row.full_name
    New-Item $dir\customers\$tnimi -ItemType Directory
    new-item $dir\customers\$tnimi\$tnimi.txt
    $row >> $dir\customers\$tnimi\$tnimi.txt
}
