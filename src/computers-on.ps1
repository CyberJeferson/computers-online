$pctextname
$newfile 
$IPv4
$pcnumber= 0
$pconcount = 0
$pcoffcount = 0
$MaxComputers = 1000 
#Script computers on, by Jeferson Oliveira
Write-Host -ForegroundColor Yellow "#########Computers on by Jeferson Oliveira##########"
$newfile = "-------Computers online------- `nDate: $(Get-Date -format "dd-MM-yyyy HH:mm:ss") `nBy Jeferson Oliveira`n-----------------" |Out-File ComputersOnOutPut.txt 
$newfile = "-------Computers Offline------- `nDate: $(Get-Date -format "dd-MM-yyyy HH:mm:ss") `nBy Jeferson Oliveira`n----------------"  | Out-File ComputersOffOutPut.txt
while ($pcnumber -lt $MaxComputers) {
    $pctextname = "ComputerName" + $pcnumber + ".domain.com" #Rename computer and domain

    $IPv4 = Test-Connection $pctextname -Count 1 -Delay 1  -ErrorAction SilentlyContinue| Select-Object -ExpandProperty IPV4Address
    if (($IPv4)) {     
    
        
        $newfile = "IP: $IPv4 : $pctextname : Status:Online! Total: $pconcount" >> ComputersOnOutPut.txt    
        Write-Host -ForegroundColor Green  "IP: $IPv4 : $pctextname : Status:Online! Total: $pconcount"
        $pconcount ++
    }else {
        
        Write-Host -ForegroundColor Red "This point requires attention--------------------------------------"
        $newfile = "$pctextname : Offline : Total: $pcoffcount" >> ComputersOffOutPut.txt 
        Write-Host -ForegroundColor Blue "$pctextname : Status : Offline : Total : $pcoffcount"
        $pcoffcount ++
    }

    $pcnumber ++
} 