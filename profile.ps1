$documentsFolder = [environment]::getfolderpath("mydocuments")
$isPersonalMachine = $documentsFolder.Contains("mseno")

$outlook = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
$spotify = $env:APPDATA + "\Spotify\Spotify.exe"
$teams = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData) + "\Microsoft\Teams\Update.exe"
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$DockerPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"


. $documentsFolder\PowerShell\themes.ps1
Write-Host "Themes loaded"

if(!$isPersonalMachine){
    . $documentsFolder\PowerShell\Work\worklauncher.ps1
    Write-Host "Work Launcher loaded" 
}

function Startup {
    Start-Utilities
    Start-Edge
    if(!$isPersonalMachine){
        Start-Teams
        #Start-Slack
        Start-VS
    }
    Write-Host "Startup complete"
}

function Start-Utilities {
    Start-Spotify
    if(!$isPersonalMachine){
        Start-Outlook
        #Start-Postman
        #Start-Docker
    }
}

function Start-Outlook {
    Start-Process $outlook -WindowStyle Maximized
}

function Start-Spotify {
    Start-Process $spotify -WindowStyle Minimized
}

function Start-Postman {
    $postman = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\Postman\Postman.exe"
    Start-Process $postman -WindowStyle Maximized

}

function Start-Teams {
    Start-Process $teams -ArgumentList "--processStart", "Teams.exe", "--process-start-args", "--profile=AAD" -WindowStyle Maximized
}

function Start-Edge {
    #Work
    Start-Process $edge --profile-directory=Default -WindowStyle Maximized
    #Personal
    #Start-Process $edge --profile-directory="Profile 1" -WindowStyle Maximized
}

function Start-Docker{
    Start-Process $DockerPath -WindowStyle Maximized
}

function Shutdown {
    Stop-Computer
}

function Restart {
    Restart-Computer
}