################################################################
######                   Router                           ######
################################################################
$routerRootPath = "C:\Users\m.senos\source\repos\TS.Router"
$routerPath = $routerRootPath + "\Source\TS.Router.sln"
$vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
$vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
$max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

function Router {
    param (
        [Alias("b")]
        [switch]$Build,
        [Alias("c")]
        [switch]$Clean,
        [Alias("u")]
        [switch]$Update,
        [Alias("r")]
        [switch]$Rebuild
    )

    switch ($true) {
        { $Build }   { Router-Build; break }
        { $Clean }   { Router-Clean; break }
        { $Update }  { Router-Update; break }
        { $Rebuild } { Router-Rebuild; break }
        default      { Router-Start }
    }
}

function Router-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $RouterPath -WindowStyle $max
}
function Router-Build {
    msbuild $routerPath /t:Build
}
function Router-Clean {
    msbuild $routerPath /t:Clean
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
function Router-Rebuild {
    msbuild $routerPath /t:Rebuild
}
function Router-Restore {
    msbuild $routerPath /t:Restore
}
