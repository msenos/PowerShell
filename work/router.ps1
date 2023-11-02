################################################################
######                   Router                           ######
################################################################
$routerRootPath = "C:\Users\m.senos\source\repos\TS.Router"
$routerPath = $routerRootPath + "\Source\TS.Router.sln"

function Router {
    Clean-Router
    Update-Router
    Build-Router
}

function Clean-Router {
    msbuild $routerPath /t:Clean
}

function Build-Router {
    msbuild $routerPath /t:Build
}

function Rebuild-Router {
    msbuild $routerPath /t:Rebuild
}

function Update-Router {
    $branch = "main"
    set-location $routerRootPath
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