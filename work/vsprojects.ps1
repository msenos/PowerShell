$vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
$vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
$max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

$reposPath = "C:\Users\m.senos\source\repos"
$RouterPath = $reposPath + "\TS.Router\Source\TS.Router.sln"
$PlannerPath = $reposPath + "\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
$PurchasingPath = $reposPath + "\TS.Purchasing\TS.Purchasing.sln"
$NesterPath = $reposPath + "\TS.Operations.Nester\src\TS.Operations.Nester.sln"
$MaterialPath = $reposPath + "\TS.Operations.Material\src\TS.Operations.Material.sln"

function VS-Start {
    ##Visual Studio
    AllRepos-Update
    
    #Router-Start
    Planner-Start
    #Purchasing-Start
    #Nester-Start
    #Material-Start
}

function AllRepos-Update{
    Planner-Update
    Router-Update
    Purchasing-Update
    Nester-Update
    Material-Update
    Production-Update
}

function Router-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $RouterPath -WindowStyle $max
}

function Planner-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $PlannerPath -WindowStyle $max
}

function Purchasing-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $PurchasingPath -WindowStyle $max
}

function Nester-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $NesterPath -WindowStyle $max
}

function Material-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $MaterialPath -WindowStyle $max
}