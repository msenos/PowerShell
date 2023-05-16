$documentsFolder = [environment]::getfolderpath("mydocuments")
$isPersonalMachine = $documentsFolder.Contains("mseno")

. $documentsFolder\PowerShell\themes.ps1
Write-Host "themes.ps1 loaded"

if(!$isPersonalMachine){
    . $documentsFolder\PowerShell\Work\worklauncher.ps1
    Write-Host "worklauncher.ps1 loaded" 
}

function Startup {
    Run-Utilities
    Run-Edge
    if(!$isPersonalMachine){
        Run-Teams
        Run-Slack
        Run-VS
    }
    Write-Host "Startup complete"
}

function Run-Utilities {
    Run-Spotify
    if(!$isPersonalMachine){
        Run-Outlook
        Run-Postman
        #Run-Docker
    }
}

function Run-Outlook {
    $outlook = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
    Start-Process $outlook -WindowStyle Maximized
}

function Run-Spotify {
    $spotify = $env:APPDATA+"\Spotify\Spotify.exe"
    Start-Process $spotify -WindowStyle Minimized
}

function Run-Postman {
    $postman = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\Postman\Postman.exe"
    Start-Process $postman -WindowStyle Maximized

}

function Run-Slack {
    $slack = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\slack\slack.exe"
    Start-Process $slack -WindowStyle Maximized
}

function Run-Teams {
    $teams = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\Microsoft\Teams\Update.exe"
    Start-Process $teams -ArgumentList "--processStart", "Teams.exe", "--process-start-args", "--profile=AAD" -WindowStyle Maximized

}

function Run-Edge {
    #Work
    $edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
    Start-Process $edge --profile-directory=Default -WindowStyle Maximized
    #Personal
    #Start-Process $edge --profile-directory="Profile 1" -WindowStyle Maximized
}

function Run-Docker{
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