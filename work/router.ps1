################################################################
######                   Router                           ######
################################################################
$routerRootPath = "C:\Users\m.senos\source\repos\TS.Router"
$routerPath = $routerRootPath + "\Source\TS.Router.sln"

function Router {
    Router-Clean
    Router-Update
    Router-Rebuild
}

function Router-Clean {
    msbuild $routerPath /t:Clean
}

function Router-Build {
    msbuild $routerPath /t:Build
}

function Router-Rebuild {
    msbuild $routerPath /t:Rebuild
}

function Router-Update {
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