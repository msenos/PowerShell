$documentsFolder = [environment]::getfolderpath("mydocuments")
$isPersonalMachine = $documentsFolder.Contains("mseno")

$outlook = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
$spotify = $env:APPDATA + "\Spotify\Spotify.exe"
$teams = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData) + "\Microsoft\Teams\Update.exe"
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$dockerPath = "C:\Program Files\Docker\Docker\Docker Desktop.exe"

#### Execution ####
. $documentsFolder\PowerShell\themes.ps1
Write-Host "Themes loaded"
. $documentsFolder\PowerShell\rewards.ps1
Write-Host "Rewards loaded"
. $documentsFolder\PowerShell\nightlight.ps1
Write-Host "NightLight loaded"

if(!$isPersonalMachine){
    . $documentsFolder\PowerShell\Work\worklauncher.ps1
    Write-Host "Work Launcher loaded" 
    Set-Location -Path "C:\Users\m.senos"
}

# function Concatenate-Strings([string]$String1, [string]$String2) {
#     $result = $String1 + " " + $String2
#     Write-Output "The concatenated string is: '$result'"
# }

# # Now, you can call this function with two strings
# Concatenate-Strings "Hello" "World"


#### End Execution ####

function Start-Work {
    Utilities-Start
    Edge-Start
    if(!$isPersonalMachine){
        Teams-Start
        VS-Start
    }
    Write-Host "Startup complete"
}
function Utilities-Start {
    Spotify-Start
    if(!$isPersonalMachine){
        Outlook-Start
        #Start-Postman
        #Start-Docker
    }
}
function Outlook-Start {
    Start-Process $outlook -WindowStyle Maximized
}
function Spotify-Start {
    Start-Process $spotify -WindowStyle Minimized
}
function Postman-Start {
    $postman = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\Postman\Postman.exe"
    Start-Process $postman -WindowStyle Maximized

}
function Teams-Start {
    Start-Process $teams -ArgumentList "--processStart", "Teams.exe", "--process-start-args", "--profile=AAD" -WindowStyle Maximized
}
function Edge-Start {
    #Work
    Start-Process $edge --profile-directory=Default -WindowStyle Maximized
    #Personal
    #Start-Process $edge --profile-directory="Profile 1" -WindowStyle Maximized
}
function Docker-Start {
    Start-Process $dockerPath -WindowStyle Maximized
}
function Shutdown {
    Stop-Computer
}
function Restart {
    Restart-Computer
}