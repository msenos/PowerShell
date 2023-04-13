################################################################
######                   Router                           ######
################################################################

function Router {
    RouterClean
    RouterBuild
}

function RouterClean {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Clean
}

function RouterBuild {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Build
}

function RouterRebuild {
    $routerPath = "C:\Users\m.senos\source\repos\TS.Router\Source\TS.Router.sln"
    msbuild $routerPath /t:Rebuild
}