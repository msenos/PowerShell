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