$machineUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$isWorkMachine = !$machineUser.Contains("mseno")
$documentsFolder = $isWorkMachine ? "C:\Users\m.senos\Documents" : [environment]::getfolderpath("mydocuments") 

$outlook      = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
$docker       = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
$edge         = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$edgeWork     = $edge + " - Work"
$edgePersonal = $edge + " - Personal"
$spotify      = $env:APPDATA + "\Spotify\Spotify.exe"

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

Write-Host "Startup complete"
if($isWorkMachine){
    Set-Location -Path "C:\Users\m.senos"
}
else {
    Set-Location - Path "C:\Users\mseno"
}
#### End Execution ####

function Start-Work {
    Start-Edge
    Start-Spotify
    Start-Outlook
    Start-Postman
    Start-Docker
    Start-VS
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
function Start-Edge {
    #Work
    Start-Process $edgeWork -WindowStyle Maximized
    #Personal
    Start-Process $edgePersonal -WindowStyle Maximized
}
function Start-Docker {
    Start-Process $docker -WindowStyle Maximized
}
function Shutdown {
    Stop-Computer
}
function Restart {
    Restart-Computer
}