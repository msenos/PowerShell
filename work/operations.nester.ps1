################################################################
######                Operations.Nester                   ######
################################################################
$nesterRootPath = "C:\Users\m.senos\source\repos\TS.Operations.Nester"
$nesterPath = $nesterRootPath + "\src\TS.Operations.NEster.sln"

function Nester {
    Nester-Clean
    Nester-Update
    Nester-Rebuild
}
function Nester-Clean {
    msbuild $nesterPath /t:Clean
}
function Nester-Build {
    msbuild $nesterPath /t:Build
}
function Nester-Rebuild {
    msbuild $nesterPath /t:Rebuild
}
function Nester-Update {
    $branch = "main"
    set-location $nesterRootPath
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