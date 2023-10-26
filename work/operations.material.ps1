################################################################
######                Operations.Material                 ######
################################################################

function Material {
    Clear-Material
    Update-Material
    Build-Material
}

function Clear-Material {
    $plannerPath = "C:\Users\m.senos\source\repos\TS.Operations.Material\src\TS.Operations.Material.sln"
    msbuild $plannerPath /t:Clean
}

function Build-Material {
    $plannerPath = "C:\Users\m.senos\source\repos\TS.Operations.Material\src\TS.Operations.Material.sln"
    msbuild $plannerPath /t:Build
}

function Rebuild-Material {
    $plannerPath = "C:\Users\m.senos\source\repos\TS.Operations.Material\src\TS.Operations.Material.sln"
    msbuild $plannerPath /t:Rebuild
}

function Update-Material {
    $branch = "main"
    $materialPath = "C:\Users\m.senos\source\repos\TS.Operations.Material"
    set-location $materialPath
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