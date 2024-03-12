################################################################
######                Production.Customer                 ######
################################################################
$prodCustomerRootPath = "C:\Users\m.senos\source\repos\TS.Production.Customer"
$prodCustomerPath = $prodCustomerRootPath + "\src\TS.Production.Customer.sln"

function ProdCustomer {
    ProdCustomer-Clean
    ProdCustomer-Update
    ProdCustomer-Rebuild
}
function ProdCustomer-Clean {
    msbuild $ProdCustomerPath /t:Clean
}
function ProdCustomer-Build {
    msbuild $ProdCustomerPath /t:Build
}
function ProdCustomer-Rebuild {
    msbuild $ProdCustomerPath /t:Rebuild
}
function ProdCustomer-Update {
    $branch = "main"
    set-location $prodCustomerRootPath
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