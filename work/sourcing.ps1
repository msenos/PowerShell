################################################################
######                     Sourcing                       ######
################################################################
$sourcingFolder = "C:\Users\mseno\source\repos\alx\backend\src\Sourcing\Alx.Sourcing.Api"
$sourcingPath = $sourcingFolder + "\Alx.Sourcing.Api.csproj"


function Sourcing {
    param (
        [Alias("b")]
        [switch]$Build,
        [Alias("c")]
        [switch]$Clean,
        [Alias("r")]
        [switch]$Rebuild
    )

    switch ($true) {
        { $Build }   { Sourcing-Build; break }
        { $Clean }   { Sourcing-Clean; break }
        { $Rebuild } { Sourcing-Rebuild; break }
        default      { Sourcing-Run; break }
    }
}

function Sourcing-Build {
    msbuild $sourcingPath /t:Build
}
function Sourcing-Clean {
    msbuild $sourcingPath /t:Clean
}
function Sourcing-Rebuild {
    msbuild $sourcingPath /t:Rebuild
}
function Sourcing-Run {
    Set-Location -Path $sourcingFolder
    dotnet run -build
}
