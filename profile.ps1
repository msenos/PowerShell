function Start-Work {
    # Start-Edge
    Start-Spotify
    Start-VS
}
function Start-Spotify {
    $spotify = $env:APPDATA + "\Spotify\Spotify.exe"
    Start-Process $spotify -WindowStyle Minimized
}
# function Start-Edge {
#     $edge         = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
#     $workProfile     = "Profile 2"
#     $personalProfile = "Default"
    
#     #Work
#     Start-Process $edge --profile-directory=$workProfile -WindowStyle Maximized
#     #Personal
#     Start-Process $edge --profile-directory=$personalProfile -WindowStyle Maximized
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
# . $documentsFolder\PowerShell\Work\vsprojects.ps1
#Write-Host "VS project loaded"
# . $documentsFolder\PowerShell\Work\sourcing.ps1
# Write-Host "VS Sourcing project loaded"
# . $documentsFolder\Powershell\code.ps1
# Write-Host "Code loaded"
Write-Host "Powershell setup complete"

# Set-Location -Path $location

#### End Execution ####