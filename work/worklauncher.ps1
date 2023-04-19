$documentsFolder = [environment]::getfolderpath("mydocuments")
. $documentsFolder\PowerShell\Work\planner.ps1
Write-Host "planner.ps1 loaded"
. $documentsFolder\PowerShell\Work\router.ps1
Write-Host "router.ps1 loaded"
. $documentsFolder\PowerShell\Work\vsprojects.ps1
Write-Host "vsprojects.ps1 loaded"