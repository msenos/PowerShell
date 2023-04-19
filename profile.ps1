$documentsFolder = [environment]::getfolderpath("mydocuments")
. $documentsFolder\PowerShell\themes.ps1
Write-Host "themes.ps1 loaded"
. $documentsFolder\PowerShell\Work\worklauncher.ps1
Write-Host "worklauncher.ps1 loaded" 

function Startup {
    Start-Utilities
    Start-Slack
    Start-Teams
    Start-Edge
    Start-VS
   
    Write-Host "Startup complete"
}

function Start-Utilities {
    Start-Outlook
    Start-Spotify
    Start-Postman
    Start-Docker
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
    $slack = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\Local\slack\slack.exe"
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
    #Start-Process $edge --profile-directory="Profile 1" -WindowStyle $max
}

function Start-Docker{
    $max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

    $DockerPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    Start-Process $DockerPath -WindowStyle $max
}

function Shutdown {
    Stop-Computer
}

function Restart {
    Restart-Computer
}