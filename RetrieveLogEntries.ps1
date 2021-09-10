#$computername = @()
#do {
#    $input = (Read-Host "Please enter computer names")
#    if ($input -ne '') {$computername += $input}
#    }
#until ($input -eq '')

[string[]] $computername = @()
$computername = Read-Host "Enter list of computers"
$computername = $computername.Split(',').TrimStart(' ').TrimEnd(' ')
$logname = Read-Host "Enter a log name"
$number = Read-Host "Enter the number of recent entries you wish to view"

    If ($computername -eq $null) {
        Write-Host "A ComputerName is required."
        } Else {
                Get-EventLog -LogName $logname -Newest $number -ComputerName $computername | Select-Object -Property Index,TimeGenerated,EntryType,Source,InstanceID,Message,MachineName | ft -GroupBy machinename -Wrap
                }
