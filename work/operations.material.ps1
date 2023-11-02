################################################################
######                Operations.Material                 ######
################################################################
$materialRootPath = "C:\Users\m.senos\source\repos\TS.Operations.Material"
$materialPath = $materialRootPath + "\src\TS.Operations.Material.sln"

function Material {
    Clean-Material
    Update-Material
    Rebuild-Material
}

function Clean-Material {
    msbuild $materialPath /t:Clean
}

function Build-Material {
    msbuild $materialPath /t:Build
}

function Rebuild-Material {
    msbuild $materialPath /t:Rebuild
}

function Update-Material {
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