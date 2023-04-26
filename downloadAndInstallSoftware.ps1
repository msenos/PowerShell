

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

#postman 
$postman = New-Object PSObject
$postman | Add-Member -MemberType NoteProperty -Name "Name" -Value "Postman"
$postman | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://dl.pstmn.io/download/latest/win64"
$postman | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\Postman-latest.exe"

#VS Code
$vscode = New-Object PSObject
$vscode | Add-Member -MemberType NoteProperty -Name "Name" -Value "VS Code"
$vscode | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://aka.ms/win32-x64-user-stable"
$vscode | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\VSCodeSetup-latest.exe"

#create a list
$appList = New-Object System.Collections.ArrayList
$appList.Add($postman)
$appList.Add($vscode)

foreach($app in $appList){
    Invoke-WebRequest -Uri $app.Uri -OutFile $app.OutFile
    Write-Host "Installing " + $app.Name
    Start-Process $app.OutFile -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES"
}