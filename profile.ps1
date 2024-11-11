function Start-Work {
    # Start-Edge
    # Start-Spotify
    # Start-Outlook
    # Start-Postman
    # Start-Docker
    # Start-VS
}
# function Start-Outlook {
#     $outlook = "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"
#     Start-Process $outlook -WindowStyle Maximized
# }
function Start-Spotify {
    $spotify = $env:APPDATA + "\Spotify\Spotify.exe"
    Start-Process $spotify -WindowStyle Minimized
}
# function Start-Postman {
#     $postman = [Environment]::GetFolderPath([Environment+SpecialFolder]::LocalApplicationData)+"\Postman\Postman.exe"
#     Start-Process $postman -WindowStyle Maximized
# }
# function Start-Edge {
#     $edge         = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
#     $edgeWork     = $edge + " - Work"
#     $edgePersonal = $edge + " - Personal"
    
#     #Work
#     Start-Process $edgeWork -WindowStyle Maximized
#     #Personal
#     Start-Process $edgePersonal -WindowStyle Maximized
# }
# function Start-Docker {
#     $docker = "C:\Program Files\Docker\Docker\Docker Desktop.exe"
#     Start-Process $docker -WindowStyle Maximized
# }
function Shutdown {
    Stop-Computer
}
function Restart {
    Restart-Computer
}

#### Execution ####
$documentsFolder = "C:\Users\mseno\OneDrive\Documents\"
. $documentsFolder\PowerShell\themes.ps1
Write-Host "Themes loaded"
. $documentsFolder\PowerShell\rewards.ps1
Write-Host "Rewards loaded"

Write-Host "Powershell setup complete"

Set-Location -Path $location

#### End Execution ####