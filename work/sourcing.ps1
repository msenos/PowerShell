################################################################
######                     Sourcing                       ######
################################################################
$sourcingPath = "C:\Users\mseno\source\repos\alx\backend\src\Sourcing\Alx.Sourcing.Api\Alx.Sourcing.Api.csproj"


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
        default      {  }
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
