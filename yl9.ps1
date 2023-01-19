#sama kataloog, mis skriptil
$scriptpath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptpath
 
#tekitame massiivi CSV päise jaoks
$csv_header = @("email;password;nimed;kasutajanimed")
 
#lisame päise CSV faili
$csv_header | Set-Content $dir\emails.csv
 
#loeme sisse kasutajad
$users = Import-Csv $dir\users.csv
 
#käime kasutajad rea kaupa läbi, loome andmed ja lisame CSV faili
ForEach($user in $users){
    $fname = $user.first_name
    $lname = $user.last_name
    
    $flname = $fname+"  "+$lname
    
    $kasutajanimi =  ($fname[0]+$lname).ToLower()
    
    $pass = 1..3 | ForEach-Object { Get-Random -Maximum $lname.Length }
    $pass = -join $lname[$pass] 
    $pass += Get-Random -Minimum 10 -Maximum 99
 
    $row = $fname.ToLower()+"."+$lname.ToLower()+"@hkhk.edu.ee;"+$pass+";"+$flname+";"+$kasutajanimi
    Add-Content $dir\emails.csv $row
}










