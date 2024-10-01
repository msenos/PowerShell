$location        = "C:\Users\mseno"
$machineUser     = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$isWorkMachine   = !$machineUser.Contains("mseno")
$documentsFolder = $isWorkMachine ? "C:\Users\m.senos\Documents" : [environment]::getfolderpath("mydocuments") 

$outlook      = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
$docker       = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
$edge         = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$edgeWork     = $edge + " - Work"
$edgePersonal = $edge + " - Personal"
$spotify      = $env:APPDATA + "\Spotify\Spotify.exe"

$themeFilePath      = "$documentsFolder\PowerShell\themes.ps1"
$rewardsFilePath    = "$documentsFolder\PowerShell\rewards.ps1"
$vsprojectsFilePath = "$documentsFolder\PowerShell\Work\vsprojects.ps1"
$routerFilePath     = "$documentsFolder\PowerShell\Work\router.ps1"
$plannerFilePath    = "$documentsFolder\PowerShell\Work\planner.ps1"
$purchasingFilePath = "$documentsFolder\PowerShell\Work\purchasing.ps1"

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
function Start-File {
    param (
        [string]$filePath,
        [string]$successMessage
    )
    
    if (Test-Path $filePath) {
        . $filePath
        Write-Host $successMessage
    } else {
        Write-Output "File not found: $filePath"
    }
}
function Shutdown {
    Stop-Computer
}
function Restart {
    Restart-Computer
}

#### Execution ####
Start-File -filePath $themeFilePath   -successMessage "Themes loaded"
Start-File -filePath $rewardsFilePath -successMessage "Rewards loaded"

if($isWorkMachine){
    Start-File -filePath $vsprojectsFilePath -successMessage "VS Projects file loaded"
    Start-File -filePath $routerFilePath     -successMessage "Router loaded"
    Start-File -filePath $plannerFilePath    -successMessage "Planner loaded"
    Start-File -filePath $purchasingFilePath -successMessage "Purchasing loaded"
    $location = "C:\Users\m.senos"
}

Write-Host "Powershell setup complete"

Set-Location -Path $location

#### End Execution ####