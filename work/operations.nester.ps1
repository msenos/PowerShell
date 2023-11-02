################################################################
######                Operations.Nester                 ######
################################################################
$nesterRootPath = "C:\Users\m.senos\source\repos\TS.Operations.Nester"
$nesterPath = $nesterRootPath + "\src\TS.Operations.NEster.sln"

function Nester {
    Clean-Nester
    Update-Nester
    Build-Nester
}

function Clean-Nester {
    msbuild $nesterPath /t:Clean
}

function Build-Nester {
    msbuild $nesterPath /t:Build
}

function Rebuild-Nester {
    msbuild $nesterPath /t:Rebuild
}

function Update-Nester {
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