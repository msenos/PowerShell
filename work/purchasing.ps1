################################################################
######                   Purchasing                       ######
################################################################
$purchasingRootPath = "C:\Users\m.senos\source\repos\TS.Purchasing"
$ediPath = $purchasingRootPath + "\TS.Purchasing.EDI.sln"
$integrationPath = $purchasingRootPath + "\TS.Purchasing.Integration.sln"
$purchasingPath = $purchasingRootPath + "\TS.Purchasing.sln"

function Purchasing {
    Purchasing-Clean
    Purchasing-Update
    Purchasing-Rebuild
}

function Purchasing-Clean {
    msbuild $ediPath /t:Clean
    msbuild $integrationPath /t:Clean
    msbuild $purchasingPath /t:Clean
}

function Purchasing-Build {
    msbuild $ediPath /t:Build
    msbuild $integrationPath /t:Build
    msbuild $purchasingPath /t:Build
}

function Purchasing-Rebuild {
    msbuild $ediPath /t:Rebuild
    msbuild $integrationPath /t:Rebuild
    msbuild $purchasingPath /t:Rebuild
}
function Purchasing-Restore {
    msbuild $PurchasingPath /t:Restore
}

function Purchasing-Update {
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