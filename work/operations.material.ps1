################################################################
######                Operations.Material                 ######
################################################################
$materialRootPath = "C:\Users\m.senos\source\repos\TS.Operations.Material"
$materialPath = $materialRootPath + "\src\TS.Operations.Material.sln"

function Material {
    Material-Clean
    Material-Update
    Material-Rebuild
}
function Material-Clean {
    msbuild $materialPath /t:Clean
}
function Material-Build {
    msbuild $materialPath /t:Build
}
function Material-Rebuild {
    msbuild $materialPath /t:Rebuild
}
function Material-Update {
    $branch = "main"
    set-location $materialRootPath
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