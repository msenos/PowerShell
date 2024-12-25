$alxRepoPath = "C:\Users\mseno\source\repos\alx"
$alxSolutionPath = $alxRepoPath + "\backend\Alx.sln"

$vs22WorkDir = "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\"
$vs22 = "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\IDE\devenv.exe"
$max = ([System.Diagnostics.ProcessWindowStyle]::Maximized)

function Alx {
    param (
        [Alias("b")]
        [switch]$Build,
        [Alias("c")]
        [switch]$Clean,
        [Alias("r")]
        [switch]$Rebuild,
        [Alias("u")]
        [switch]$Update
    )

    switch ($true) {
        { $Build }   { AlxRepos-Build; break }
        { $Clean }   { AlxRepos-Clean; break }
        { $Rebuild } { AlxRepos-Rebuild; break }
        { $Update }  { AlxRepos-Update; break }
        default      { Alx-Start; break }
    }
}

function AlxRepos-Build{
    msbuild $alxSolutionPath /t:Build
}
function AlxRepos-Clean{
    msbuild $alxSolutionPath /t:Clean
}
function AlxRepos-Rebuild{
    msbuild $alxSolutionPath /t:Rebuild
}
function AlxRepos-Update{
    $branch = "develop"
    set-location $alxRepoPath
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
function Alx-Start {
    Start-Process $vs22 -WorkingDirectory $vs22WorkDir -ArgumentList $alxRepoPath -WindowStyle $max
}

function Run-AlxConfiguration{
    try { 
        # Navigate to the specified directory 
        Set-Location -Path "C:\Users\mseno\source\repos\alx\backend\src\Configurations\Alx.Configurations.Api"
        # Run the dotnet run command 
        dotnet run 
        Write-Host "API is running from $Path" -ForegroundColor Green 
    } 
    catch { 
        Write-Host "An error occurred: $_" -ForegroundColor Red 
    }
}
function Run-AlxAdminApp{
    try { 
        # Navigate to the specified directory 
        Set-Location -Path "C:\Users\mseno\source\repos\alx\web\apps\admin"
        # Run the dotnet run command 
        npm start
        Write-Host "API is running from $Path" -ForegroundColor Green 
    } 
    catch { 
        Write-Host "An error occurred: $_" -ForegroundColor Red 
    }
}
