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

#VS Professional
$vspro = New-Object PSObject
$vspro | Add-Member -MemberType NoteProperty -Name "Name" -Value "VS Professional"
$vspro | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://aka.ms/vs/17/release/vs_Professional.exe"
$vspro | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\vs_Professional.exe"

#PowerToys
$powertoys = New-Object PSObject
$powertoys | Add-Member -MemberType NoteProperty -Name "Name" -Value "PowerToys"
$powertoys | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://github.com/microsoft/PowerToys/releases/download/v0.69.1/PowerToysSetup-0.69.1-x64.exe"
$powertoys | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\PowerToysSetup.exe"

#ditto
$ditto = New-Object PSObject
$ditto | Add-Member -MemberType NoteProperty -Name "Name" -Value "ditto"
$ditto | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://github.com/sabrogden/Ditto/releases/download/3.24.246.0/DittoSetup_64bit_3_24_246_0.exe"
$ditto | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\DittoSetup_latest.exe"

#notepadd++
$notepad = New-Object PSObject
$notepad | Add-Member -MemberType NoteProperty -Name "Name" -Value "Notepad++"
$notepad | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.2/npp.8.5.2.Installer.x64.exe"
$notepad | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\npp_latest.exe"

#docker
#notepadd++
$docker = New-Object PSObject
$docker | Add-Member -MemberType NoteProperty -Name "Name" -Value "Docker"
$docker | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
$docker | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\docker_latest.exe"

#git 
$git = New-Object PSObject
$git | Add-Member -MemberType NoteProperty -Name "Name" -Value "git"
$git | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://github.com/git-for-windows/git/releases/download/v2.40.1.windows.1/Git-2.40.1-64-bit.exe"
$git | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\git_latest.exe"

#SqlServer Developer Edition
$ssde = New-Object PSObject
$ssde | Add-Member -MemberType NoteProperty -Name "Name" -Value "SqlServer Developer Edition"
$ssde | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://go.microsoft.com/fwlink/p/?linkid=2215158&clcid=0x409&culture=en-us&country=us"
$ssde | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\ssde_latest.exe"

#SqlServer Management Studio
$ssms = New-Object PSObject
$ssms | Add-Member -MemberType NoteProperty -Name "Name" -Value "SqlServer Management Studio"
$ssms | Add-Member -MemberType NoteProperty -Name "Uri" -Value "https://aka.ms/ssmsfullsetup"
$ssms | Add-Member -MemberType NoteProperty -Name "OutFile" -Value "$env:USERPROFILE\Downloads\ssms_latest.exe"

#spotify
#logitech options
#winrar

#create a list
$appList = New-Object System.Collections.ArrayList
$appList.Add($postman)
$appList.Add($vscode)
$appList.Add($vspro)
$appList.Add($powertoys)
$appList.Add($ditto)
$appList.Add($notepad)
$appList.Add($docker)
$appList.Add($git)
$appList.Add($ssms)

foreach($app in $appList){
    Invoke-WebRequest -Uri $app.Uri -OutFile $app.OutFile
    Write-Host "Installing " $app.Name
    #Start-Process $app.OutFile -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES"
}