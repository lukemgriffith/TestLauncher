 $key = "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\winlogon"
gi $key | more
New-ItemProperty -Path $key -Name AutoAdminLogon -Value 1
Set-ItemProperty -Path $key -Name DefaultUsername -Value testUser
Set-ItemProperty -Path $key -Name DefaultPassword -Value testP4ssw0rd
net user testUser testP4ssw0rd /add
