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