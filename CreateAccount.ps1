$users = Import-CSV c:\users.csv

ForEach ($u in $users) {
    $path = "OU=" + $u.Department + ",DC=Adatum,DC=com"
    $upn = $u.UserID + "@adatum.com"
    $display = $u.First + " " + $u.Last
    $identity = $u.UserID
    If (Get-ADUser -Filter 'name -eq $display') {
        Write-Host "User $display already exist"
    } Else {
    Write-Host "Creating $display in $path"
    New-ADUser -GivenName $u.First -Surname $u.Last -Name $display -DisplayName $display -SamAccountName $u.UserID -UserPrincipalName $UPN -Path $path -Department $u.Department
    $password = Read-Host "Enter Password" -AsSecureString
    Set-ADAccountPassword -Identity $identity -NewPassword $password
    Set-ADUser -Identity $identity -Enabled $true 
    }
}

