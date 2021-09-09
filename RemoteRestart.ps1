[string[]]$computername = Read-Host 'Enter Computername'
[string]$state = Read-Host 'Enter: Logoff, ShutDown, Restart, or Poweroff'


switch ($state) {
    "LogOff"   {$_action = 4 }
    "Shutdown" {$_action = 5 }
    "Restart"  {$_action = 6 }
    "PowerOff" {$_action = 12}
    }

$os = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $computername -EnableAllPrivileges
$return = $os.win32shutdown($_action) 
Write-Host -Verbose "Return value from $computername is $($return.returnvalue), success = 0"