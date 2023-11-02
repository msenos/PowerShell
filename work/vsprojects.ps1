$vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
$vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
$max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

$RouterPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
$PlannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
$PurchasingPath = "C:\Users\m.senos\source\repos\TS.Purchasing\TS.Purchasing.sln"
$OperationsNesterPath = "C:\Users\m.senos\source\repos\TS.Operations.Nester\src\TS.Operations.Nester.sln"
$OperationsMaterialPath = "C:\Users\m.senos\source\repos\TS.Operations.Material\src\TS.Operations.Material.sln"

function Start-VS {
    ##Visual Studio
    Router-Start
    Planner-Start
    #Purchasing-Start
    #Nester-Start
    Material-Start
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
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $OperationsNesterPath -WindowStyle $max
}

function Material-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $OperationsMaterialPath -WindowStyle $max
}