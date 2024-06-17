################################################################
######                   Planner                          ######
################################################################
$plannerRootPath = "C:\Users\m.senos\source\repos\TS.Production.Planner"
$importPath = $plannerRootPath + "\source\TS.Production.Planner.Import.sln"
$integrationsPath = $plannerRootPath + "\source\TS.Production.Planner.Integrations.Nav.sln"
$plannerPath = $plannerRootPath + "\source\TS.Production.Planner.Manager.Web.sln"
$vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE"
$vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Professional\Common7\IDE\devenv.exe"
$max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

function Planner {
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

    switch ($PSBoundParameters.Keys) 
    {
        "Build"   { Planner-Build }
        "b"       { Planner-Build }
        "Clean"   { Planner-Clean }
        "c"       { Planner-Clean }
        "Update"  { Planner-Update }
        "u"       { Planner-Update }
        "Rebuild" { Planner-Rebuild }
        "r"       { Planner-Rebuild }
        default   { Planner-Start }
    }
}
function Planner-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $PlannerPath -WindowStyle $max
}
function Planner-Build {
    msbuild $importPath /t:Build
    msbuild $integrationsPath /t:Build
    msbuild $plannerPath /t:Build
}
function Planner-Clean {
    msbuild $importPath /t:Clean
    msbuild $integrationsPath /t:Clean
    msbuild $plannerPath /t:Clean
}
function Planner-Update {
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
function Planner-Rebuild {
    msbuild $importPath /t:Rebuild
    msbuild $integrationsPath /t:Rebuild
    msbuild $plannerPath /t:Rebuild
}
function Planner-Restore {
    msbuild $plannerPath /t:Restore
}
