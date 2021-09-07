$Computername = Read-Host 'Enter a computer name'
$services = Get-Content C:\services.txt


ForEach ($s in $services) {
    $starttype = (Get-Service -ComputerName $Computername -Name $s).StartType
    If ($Starttype -ne "Automatic") {
        Set-Service -ComputerName $Computername $s -StartupType Automatic
        Write-Host "Startup set to automatic for $s"
    } Else {
        Write-Host "$s is already started automatically"
    }
}