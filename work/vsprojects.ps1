function Start-VS {
    ##Visual Studio
    Repos-Update

    #Router
    Start-Sleep -Seconds 1
    Router-Start
}
function Repos-Update{
    Router-Update
}
function Repos-Clean{
    Router-Clean
}
function Repos-Build{
    Router-Build
}
function Repos-Rebuild{
    Router-Rebuild
}
