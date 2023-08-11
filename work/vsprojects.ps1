function Start-VS {
    #Visual Studio
    #Start-Router
    Start-Planner
    #Start-Purchasing
    #Start-Operations-Nester
}

function Start-Router {
    $max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)
    
    $RouterPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    $vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
    $vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
    
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $RouterPath -WindowStyle $max
}

function Start-Planner {
    $max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)
    
    $PlannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
    $vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
    $vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
    
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $PlannerPath -WindowStyle $max
}

function Start-Purchasing {
    $max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)
    
    $PurchasingPath = "C:\Users\m.senos\source\repos\TS.Purchasing\TS.Purchasing.sln"
    $vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
    $vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
    
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $PurchasingPath -WindowStyle $max
}

function Start-Operations-Nester {
    $max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)
    
    $OperationsNesterPath = "C:\Users\m.senos\source\repos\TS.Operations.Nester\src\TS.Operations.Nester.sln"
    $vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
    $vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
    
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $OperationsNesterPath -WindowStyle $max
}