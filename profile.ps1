. C:\Users\m.senos\Documents\PowerShell\themes.ps1
. C:\Users\m.senos\Documents\PowerShell\work.ps1

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

################################################################
######                   Planner                          ######
################################################################

function Planner {
    PlannerClean
    PlannerBuild
}

function PlannerClean {
    $importPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Import.sln"
    msbuild $importPath /t:Clean

    $integrationsPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Integrations.Nav.sln"
    msbuild $integrationsPath /t:Clean
    
    $plannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
    msbuild $plannerPath /t:Clean
}

function PlannerBuild {
    $importPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Import.sln"
    msbuild $importPath /t:Build
    
    $integrationsPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Integrations.Nav.sln"
    msbuild $integrationsPath /t:Build
    
    $plannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
    msbuild $plannerPath /t:Build
    
}

function PlannerRebuild {
    $importPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Import.sln"
    msbuild $importPath /t:Rebuild

    $integrationsPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Integrations.Nav.sln"
    msbuild $integrationsPath /t:Rebuild

    $plannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
    msbuild $plannerPath /t:Rebuild
}

################################################################
######                   Router                           ######
################################################################

function Router {
    RouterClean
    RouterBuild
}

function RouterClean {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Clean
}

function RouterBuild {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Build
}

function RouterRebuild {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Rebuild
}



function Shutdown {
    Stop-Computer
}

function Restart {
    Restart-Computer
}