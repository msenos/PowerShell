$documentsFolder = [environment]::getfolderpath("mydocuments")
$isPersonalMachine = $documentsFolder.Contains("mseno")

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
    $outlook = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
    Start-Process $outlook -WindowStyle Maximized
}

function Start-Spotify {
    $spotify = $env:APPDATA+"\Spotify\Spotify.exe"
    Start-Process $spotify -WindowStyle Minimized
}

function Start-Postman {
    $postman = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\Postman\Postman.exe"
    Start-Process $postman -WindowStyle Maximized

}

function Start-Slack {
    $slack = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\slack\slack.exe"
    Start-Process $slack -WindowStyle Maximized
}

function Start-Teams {
    $teams = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\Microsoft\Teams\Update.exe"
    Start-Process $teams -ArgumentList "--processStart", "Teams.exe", "--process-start-args", "--profile=AAD" -WindowStyle Maximized

}

function Start-Edge {
    #Work
    $edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    Start-Process $edge --profile-directory=Default -WindowStyle Maximized
    #Personal
    #Start-Process $edge --profile-directory="Profile 1" -WindowStyle Maximized
}

function Start-Docker{
    $DockerPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    Start-Process $DockerPath -WindowStyle Maximized
}

function Shutdown {
    Stop-Computer
}

function Restart {
    Restart-Computer
}