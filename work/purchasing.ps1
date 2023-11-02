################################################################
######                   Purchasing                       ######
################################################################
$purchasingRootPath = "C:\Users\m.senos\source\repos\TS.Purchasing"
$ediPath = $purchasingRootPath + "\TS.Purchasing.EDI.sln"
$integrationPath = $purchasingRootPath + "\TS.Purchasing.Integration.sln"
$purchasingPath = $purchasingRootPath + "\TS.Purchasing.sln"

function Purchasing {
    Clean-Purchasing
    Update-Purchasing
    Rebuild-Purchasing
}

function Clean-Purchasing {
    msbuild $ediPath /t:Clean
    msbuild $integrationPath /t:Clean
    msbuild $purchasingPath /t:Clean
}

function Build-Purchasing {
    msbuild $ediPath /t:Build
    msbuild $integrationPath /t:Build
    msbuild $purchasingPath /t:Build
}

function Rebuild-Purchasing {
    msbuild $ediPath /t:Rebuild
    msbuild $integrationPath /t:Rebuild
    msbuild $purchasingPath /t:Rebuild
}

function Update-Purchasing {
    $branch = "master"
    set-location $purchasingRootPath
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