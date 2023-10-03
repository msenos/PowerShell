################################################################
######                   Router                           ######
################################################################

function Router {
    Clear-Router
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
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router"
    set-location $routerPath
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