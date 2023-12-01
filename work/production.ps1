################################################################
######                   Production                       ######
################################################################
$productionRootPath = "C:\Users\m.senos\source\repos\TS.Production"
$commonAuthorizationPath = $productionRootPath + "\source\TS.Common.Authorization\TS.Common.Authorization.sln"
$productionPath = $productionRootPath + "\source\TS.Production.sln"

function Production {
    Production-Clean
    Production-Update
    Production-Rebuild
}

function Production-Clean {
    msbuild $commonAuthorizationPath /t:Clean
    msbuild $ProductionPath /t:Clean
}

function Production-Build {
    msbuild $commonAuthorizationPath /t:Build
    msbuild $ProductionPath /t:Build
}

function Production-Rebuild {
    msbuild $commonAuthorizationPath /t:Rebuild
    msbuild $ProductionPath /t:Rebuild
}

function Production-Restore {
    msbuild $ProductionPath /t:Restore
}

function Production-Update {
    $branch = "master"
    set-location $productionRootPath
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