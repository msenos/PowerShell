################################################################
######                   Planner                          ######
################################################################
$plannerRootPath = "C:\Users\m.senos\source\repos\TS.Production.Planner"
$importPath = $plannerRootPath + "\source\TS.Production.Planner.Import.sln"
$integrationsPath = $plannerRootPath + "\source\TS.Production.Planner.Integrations.Nav.sln"
$plannerPath = $plannerRootPath + "\source\TS.Production.Planner.Manager.Web.sln"

function Planner {
    Clean-Planner
    Update-Planner
    Rebuild-Planner
}

function Clean-Planner {
    msbuild $importPath /t:Clean
    msbuild $integrationsPath /t:Clean
    msbuild $plannerPath /t:Clean
}

function Build-Planner {
    msbuild $importPath /t:Build
    msbuild $integrationsPath /t:Build
    msbuild $plannerPath /t:Build
}

function Rebuild-Planner {
    msbuild $importPath /t:Rebuild
    msbuild $integrationsPath /t:Rebuild
    msbuild $plannerPath /t:Rebuild
}

function Update-Planner {
    $branch = "master"
    set-location $plannerRootPath
    $localBranch = git rev-parse --abbrev-ref HEAD
    $isMasterBranch = $localBranch.Contains($branch)
    if(!$isMasterBranch) {
        git fetch origin $branch
        git checkout $localBranch
        git merge origin/$branch
    }
    else {
        git pull
    }
}