function Start-VS {
    $max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

    #Visual Studio
    #$RouterPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    #$PlannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
    $PurchasingPath = "C:\Users\m.senos\source\repos\TS.Purchasing\TS.Purchasing.sln"

    $pathsList = #$RouterPath, 
                 $PlannerPath,
                 $PurchasingPath
    $vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
    $vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"

    foreach ($solution in $pathsList) {
        Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $solution -WindowStyle $max
    }
}