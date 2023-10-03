################################################################
######                   Planner                          ######
################################################################

function Planner {
    Clear-Planner
    Build-Planner
}

function Clear-Planner {
    $importPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Import.sln"
    msbuild $importPath /t:Clean

    $integrationsPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Integrations.Nav.sln"
    msbuild $integrationsPath /t:Clean
    
    $plannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
    msbuild $plannerPath /t:Clean
}

function Build-Planner {
    $importPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Import.sln"
    msbuild $importPath /t:Build
    
    $integrationsPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Integrations.Nav.sln"
    msbuild $integrationsPath /t:Build
    
    $plannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
    msbuild $plannerPath /t:Build
}

function Rebuild-Planner {
    $importPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Import.sln"
    msbuild $importPath /t:Rebuild

    $integrationsPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Integrations.Nav.sln"
    msbuild $integrationsPath /t:Rebuild

    $plannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner\source\TS.Production.Planner.Manager.Web.sln"
    msbuild $plannerPath /t:Rebuild
}

function Update-Planner {
    $plannerPath = "C:\Users\m.senos\source\repos\TS.Production.Planner"
    set-location $plannerPath
    $activeBranch = git rev-parse --abbrev-ref HEAD
    $isMasterBranch = $activeBranch.Contains("master")
    if(!$isMasterBranch) {
        git switch master
        git pull
        git switch $activeBranch
        git merge master
    }
    else {
        git pull
    }
}