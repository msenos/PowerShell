#postaman
Invoke-WebRequest -Uri "https://dl.pstmn.io/download/latest/win64" -OutFile "$env:USERPROFILE\Downloads\Postman-latest.exe"
Start-Process "$env:USERPROFILE\Downloads\Postman-latest.exe" -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES"



#VSCode
Invoke-WebRequest -Uri "https://aka.ms/win32-x64-user-stable" -OutFile "$env:USERPROFILE\Downloads\VSCodeSetup-latest.exe"
Start-Process "$env:USERPROFILE\Downloads\VSCodeSetup-latest.exe" -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES"
#VSProfessional
Invoke-WebRequest -Uri "https://aka.ms/vs/17/release/vs_Professional.exe" -OutFile "$env:USERPROFILE\Downloads\vs_Professional.exe"
Start-Process "$env:USERPROFILE\Downloads\vs_Professional.exe" -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES"
#PowerToys
$ProgressPreference = 'SilentlyContinue'
$PowerToysURL = 'https://github.com/microsoft/PowerToys/releases/latest/download/PowerToysSetup.exe'
$PowerToysInstaller = "$env:USERPROFILE\Downloads\PowerToysSetup.exe"
Invoke-WebRequest -Uri $PowerToysURL -OutFile $PowerToysInstaller
Start-Process -FilePath $PowerToysInstaller -ArgumentList '/S' -Wait
#ditto
$source = "https://ditto-cp.sourceforge.io/DittoSetup_3_23_124_0.exe"
$destination = "$env:USERPROFILE\Downloads\DittoSetup_3_23_124_0.exe"
Invoke-WebRequest -Uri $source -OutFile $destination
Start-Process $destination -ArgumentList "/S" -Wait
#Notepad++
$DownloadUrl = "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/latest/download/npp.*.Installer.exe"
Write-Host "Downloading the latest Notepad++ to the temp folder"
Invoke-WebRequest -Uri $DownloadUrl -OutFile "$env:TEMP\$ (Split-Path -Path $DownloadUrl -Leaf)" | Out-Null
Write-Host "Installing the latest Notepad++"
Start-Process -FilePath "$env:TEMP\$ (Split-Path -Path $DownloadUrl -Leaf)" -ArgumentList "/S" -Wait

#Creating an object
$myHashtable = @{
    Name = 'Kevin'
    Language = 'PowerShell'
    State = 'Texas'
}
$myObject = New-Object -TypeName PSObject -Property $myHashtable

#create a list
$myList = New-Object System.Collections.ArrayList
$myList.Add("object1")
$myList.Add("object2")
# OR
$myObject = New-Object PSObject
$myObject | Add-Member -MemberType NoteProperty -Name "Name" -Value "John"
$myObject | Add-Member -MemberType NoteProperty -Name "Age" -Value "30"