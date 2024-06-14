################################################################
######                   Purchasing                       ######
################################################################
$purchasingRootPath = "C:\Users\m.senos\source\repos\TS.Purchasing"
$ediPath = $purchasingRootPath + "\TS.Purchasing.EDI.sln"
$integrationPath = $purchasingRootPath + "\TS.Purchasing.Integration.sln"
$purchasingPath = $purchasingRootPath + "\TS.Purchasing.sln"

function Purchasing {
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
        "Build"   { Purchasing-Build }
        "b"       {Purchasing-Build}
        "Clean"   { Purchasing-Clean }
        "c"       { Purchasing-Clean }
        "Update"  { Purchasing-Update }
        "u"       { Purchasing-Update }
        "Rebuild" { Purchasing-Rebuild }
        "r"       { Purchasing-Rebuild }
        default   { Write-Host "Supported actions are: -Build, -Clean, -Update and -Rebuild" }
    }
}
function Purchasing-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $PurchasingPath -WindowStyle $max
}
function Purchasing-Build {
    msbuild $ediPath /t:Build
    msbuild $integrationPath /t:Build
    msbuild $purchasingPath /t:Build
}
function Purchasing-Clean {
    msbuild $ediPath /t:Clean
    msbuild $integrationPath /t:Clean
    msbuild $purchasingPath /t:Clean
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
function Purchasing-Rebuild {
    msbuild $ediPath /t:Rebuild
    msbuild $integrationPath /t:Rebuild
    msbuild $purchasingPath /t:Rebuild
}
function Purchasing-Restore {
    msbuild $PurchasingPath /t:Restore
}
