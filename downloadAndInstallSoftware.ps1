# Define a custom object type for the apps
class App {
    [string]$Name
    [string]$Uri
    [string]$OutFile
    App($Name, $Uri, $OutFile) {
        $this.Name = $Name
        $this.Uri = $Uri
        $this.OutFile = $OutFile
    }
}

# Create a list of apps using the custom object type
$appList = @(
    [App]::new(
        "ditto", 
        "https://github.com/sabrogden/Ditto/releases/download/3.24.246.0/DittoSetup_64bit_3_24_246_0.exe", 
        "$env:USERPROFILE\Downloads\DittoSetup_latest.exe")
    [App]::new(
        "VS Code", 
        "https://aka.ms/win32-x64-user-stable", 
        "$env:USERPROFILE\Downloads\VSCodeSetup-latest.exe")
    [App]::new(
        "git",
        "https://github.com/git-for-windows/git/releases/download/v2.40.1.windows.1/Git-2.40.1-64-bit.exe",
        "$env:USERPROFILE\Downloads\git_latest.exe")
    [App]::new(
        "Notepad++", 
        "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.5.2/npp.8.5.2.Installer.x64.exe", 
        "$env:USERPROFILE\Downloads\npp_latest.exe")
    [App]::new(
        "PowerToys", 
        "https://github.com/microsoft/PowerToys/releases/download/v0.69.1/PowerToysSetup-0.69.1-x64.exe", 
        "$env:USERPROFILE\Downloads\PowerToysSetup.exe")
    [App]::new(
        "Postman", 
        "https://dl.pstmn.io/download/latest/win64", 
        "$env:USERPROFILE\Downloads\Postman-latest.exe")
    [App]::new(
        "Docker", 
        "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe", 
        "$env:USERPROFILE\Downloads\docker_latest.exe")
    [App]::new(
        "VS Professional", 
        "https://aka.ms/vs/17/release/vs_Professional.exe", 
        "$env:USERPROFILE\Downloads\vs_Professional.exe")
    [App]::new(
        "SqlServer Developer Edition",
        "https://go.microsoft.com/fwlink/p/?linkid=2215158&clcid=0x409&culture=en-us&country=us",
        "$env:USERPROFILE\Downloads\ssde_latest.exe")
    [App]::new(
        "SqlServer Management Studio",
        "https://aka.ms/ssmsfullsetup",
        "$env:USERPROFILE\Downloads\ssms_latest.exe")
)

# Loop through the list of apps and download them
foreach($app in $appList){
    Write-Host "Downloading $($app.Name)"
    Invoke-WebRequest -Uri $app.Uri -OutFile $app.OutFile
    Write-Host "Installing $($app.Name)"
    #Start-Process $app.OutFile -ArgumentList "/VERYSILENT /NORESTART /SUPPRESSMSGBOXES"
}