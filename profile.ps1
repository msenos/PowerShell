function Start-Work {
    Start-Spotify
    Start-VS
}
function Start-Spotify {
    $spotify = Join-Path $env:APPDATA 'Spotify\Spotify.exe'
    if (Test-Path $spotify) {
        Start-Process -FilePath $spotify -WindowStyle Minimized
    } else {
        Write-Warning "Spotify was not found at $spotify"
    }
}

function Start-VS {
    $visualStudio = Get-Command devenv.exe -ErrorAction SilentlyContinue
    if ($null -eq $visualStudio) {
        Write-Warning "Visual Studio (devenv.exe) was not found on PATH"
        return
    }
    Start-Process -FilePath $visualStudio.Source
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

function Get-PublicIP {
    try {
        $ip = Invoke-RestMethod -Uri "https://api.ipify.org" -TimeoutSec 2
        $ip | Set-Clipboard
        Write-Host "Public IP $ip copied to clipboard!" -ForegroundColor Green
    } catch {
        Write-Warning "Could not retrieve public IP. Check your connection."
    }
}

function Shutdown {
    Stop-Computer
}
function Restart {
    Restart-Computer
}

#### Execution ####
$scriptRoot = $PSScriptRoot
. (Join-Path $scriptRoot 'themes.ps1')
Write-Host "Themes loaded"
. (Join-Path $scriptRoot 'rewards.ps1')
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