$nimi = "Jan-Martti Olop"
$email = "jannu.olop@gmail.com"
$kp = get-date -Format "dd.MM.yy"


$nimi
$email
$kp



$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht
$emailid = Get-Content -path $dir\emailid.txt


$kasutajad = $emailid.split(",")
$kasutajad+= $email
"Esimene kasutaja on "+$kasutajad[0]
"Viimane kasutaja on "+$kasutajad[-1]
"Kasutajad kokku on "+$kasutajad.Length






