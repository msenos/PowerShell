$documentsFolder = "C:\Users\m.senos\Documents" #[environment]::getfolderpath("mydocuments")
$isWorkMachine = $documentsFolder.Contains("m.senos")

$outlook      = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
$dockerPath   = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
$edge         = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$edgeWork     = $edge + " - Work"
$edgePersonal = $edge + " - Personal"
$spotify      = $env:APPDATA + "\Spotify\Spotify.exe"
# $teams        = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData) + "\Microsoft\Teams\Update.exe"

#### Execution ####
. $documentsFolder\PowerShell\themes.ps1
Write-Host "Themes loaded"
. $documentsFolder\PowerShell\rewards.ps1
Write-Host "Rewards loaded"

if($isWorkMachine){
    . $documentsFolder\PowerShell\Work\vsprojects.ps1
    . $documentsFolder\PowerShell\Work\router.ps1
    . $documentsFolder\PowerShell\Work\planner.ps1
    . $documentsFolder\PowerShell\Work\purchasing.ps1
    Write-Host "Work loaded" 
    }

#### End Execution ####

function Start-Work {
    Start-Edge
    Start-Spotify
    Start-Outlook
    # Start-Postman
    # Start-Docker

    if(!$isPersonalMachine){
        # Start-Teams
        VS-Start
    }
    Write-Host "Startup complete"
    Set-Location -Path "C:\Users\m.senos"
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
# function Start-Teams {
#     Start-Process $teams -ArgumentList "--processStart", "Teams.exe", "--process-start-args", "--profile=AAD" -WindowStyle Maximized
# }
function Start-Edge {
    #Work
    Start-Process $edgeWork -WindowStyle Maximized
    #Personal
    Start-Process $edgePersonal -WindowStyle Maximized
}
function Start-Docker {
    Start-Process $dockerPath -WindowStyle Maximized
}
function Shutdown {
    Stop-Computer
}
function Restart {
    Restart-Computer
}