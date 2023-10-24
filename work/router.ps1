################################################################
######                   Router                           ######
################################################################

function Router {
    Clear-Router
    Update-Router
    Build-Router
}

function Clear-Router {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Clean
}

function Build-Router {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Build
}

function Rebuild-Router {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Rebuild
}

function Update-Router {
    $branch = "main"
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router"
    set-location $routerPath
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