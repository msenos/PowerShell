$vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
$vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
$max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

$reposPath        = "C:\Users\m.senos\source\repos"
$RouterPath       = $reposPath + "\TS.Router\Source\TS.Router.sln"
$PlannerPath      = $reposPath + "\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
$PurchasingPath   = $reposPath + "\TS.Purchasing\TS.Purchasing.sln"
# $NesterPath       = $reposPath + "\TS.Operations.Nester\src\TS.Operations.Nester.sln"
# $MaterialPath     = $reposPath + "\TS.Operations.Material\src\TS.Operations.Material.sln"
# $ProdCustomerPath = $reposPath + "\TS.Production.Customer\src\TS.Production.Customer.sln"

function VS-Start {
    ##Visual Studio
    Repos-Update
    
    Router-Start
    Start-Sleep -Seconds 1
    Planner-Start
    Start-Sleep -Seconds 1
    Purchasing-Start
    #Nester-Start
    #Material-Start
}
function Repos-Update{
    Router-Update
    Planner-Update
    Purchasing-Update
    # Nester-Update
    # Material-Update
    # Production-Update
    # ProdCustomer-Update
}
function Repos-Clean{
    Router-Clean
    Planner-Clean
    Purchasing-Clean
    # Nester-Clean
    # Material-Clean
    # Production-Clean
    # ProdCustomer-Clean
}
function Repos-Build{
    Router-Build
    Planner-Build
    Purchasing-Build
    # Nester-Build
    # Material-Build
    # Production-Build
    # ProdCustomer-Build
}
function Repos-Rebuild{
    Router-Rebuild
    Planner-Rebuild
    Purchasing-Rebuild
    # Nester-Rebuild
    # Material-Rebuild
    # Production-Rebuild
    # ProdCustomer-Rebuild
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
# function Nester-Start {
#     Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $NesterPath -WindowStyle $max
# }
# function Material-Start {
#     Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $MaterialPath -WindowStyle $max
# }
# function ProdCustomer-Start {
#     Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $ProdCustomerPath -WindowStyle $max
# }