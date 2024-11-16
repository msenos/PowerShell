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
