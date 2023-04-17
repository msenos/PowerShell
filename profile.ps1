. C:\Users\m.senos\Documents\PowerShell\themes.ps1
Write-Host "themes.ps1 loaded"
. C:\Users\m.senos\Documents\PowerShell\Work\worklauncher.ps1
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
    $spotify = "C:\Users\m.senos\AppData\Roaming\Spotify\Spotify.exe"
    Start-Process $spotify -WindowStyle Minimized
}

function Start-Postman {
    $postman = "C:\Users\m.senos\AppData\Local\Postman\Postman.exe"
    Start-Process $postman -WindowStyle Maximized

}

function Start-Slack {
    $slack = "C:\Users\m.senos\AppData\Local\slack\slack.exe"
    Start-Process $slack -WindowStyle Maximized
}

function Start-Teams {
    $teams = "C:\Users\m.senos\AppData\Local\Microsoft\Teams\Update.exe"
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