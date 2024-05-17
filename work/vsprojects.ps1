$vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
$vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
$max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

$reposPath        = "C:\Users\m.senos\source\repos"
$RouterPath       = $reposPath + "\TS.Router\Source\TS.Router.sln"
$PlannerPath      = $reposPath + "\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
$PurchasingPath   = $reposPath + "\TS.Purchasing\TS.Purchasing.sln"

function VS-Start {
    ##Visual Studio
    Repos-Update
    
    Start-Sleep -Seconds 1
    Router-Start
    Start-Sleep -Seconds 1
    Planner-Start
    Start-Sleep -Seconds 1
    Purchasing-Start
}
function Repos-Update{
    Router-Update
    Planner-Update
    Purchasing-Update
}
function Repos-Clean{
    Router-Clean
    Planner-Clean
    Purchasing-Clean
}
function Repos-Build{
    Router-Build
    Planner-Build
    Purchasing-Build
}
function Repos-Rebuild{
    Router-Rebuild
    Planner-Rebuild
    Purchasing-Rebuild
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
