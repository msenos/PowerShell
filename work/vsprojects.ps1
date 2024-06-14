function VS-Start {
    ##Visual Studio
    Repos-Update

    Start-Sleep -Seconds 1
    Router-Start
    Start-Sleep -Seconds 1
    Planner-Start
    Start-Sleep -Seconds 1
    Purchasing-Start
}
function Repos-Update{
    Router-Update
    Planner-Update
    Purchasing-Update
}
function Repos-Clean{
    Router-Clean
    Planner-Clean
    Purchasing-Clean
}
function Repos-Build{
    Router-Build
    Planner-Build
    Purchasing-Build
}
function Repos-Rebuild{
    Router-Rebuild
    Planner-Rebuild
    Purchasing-Rebuild
}
