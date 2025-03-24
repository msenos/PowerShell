Import-Module SqlServer

# Function to create the database
function Create-Database {
    param (
        [string]$databaseName
    )

    # Nome da instância do SQL Server e configurações
    $serverInstance = "localhost, 1433" # Substitua pelo nome da sua instância SQL Server
    
    # Comando SQL para criar a base de dados
    $sqlCommand = @"
    CREATE DATABASE [$databaseName]
"@

    # Conectar ao SQL Server e executar o comando
    Invoke-Sqlcmd -ServerInstance $serverInstance -Query $sqlCommand -Username "sa" -Password "_mig5Khnum" -TrustServerCertificate

    # Confirmação
    Write-Host "Database '$databaseName' created successfully on instance '$serverInstance'."
}

# Function to create a clean architecture project
function Start-CleanProject {
    # Prompt for the project name
    $projectName = Read-Host "Enter the project name"
    # Optional: Ask user if they want to add a BlazorClient project
    $addBlazor = Read-Host "Do you want to add a BlazorClient project? (yes/no)"

    # Create the project folder and navigate into it
    Set-Location -Path "C:\Users\mseno\source\repos"
    New-Item -ItemType Directory -Name $projectName
    Set-Location -Path $projectName

    # Create the solution
    dotnet new sln -n $projectName

    # Create main projects
    dotnet new webapi -n "$projectName.Api"              # Api layer
    dotnet new classlib -n "$projectName.Domain"         # Domain layer
    dotnet new classlib -n "$projectName.Application"    # Application layer
    dotnet new classlib -n "$projectName.Infrastructure" # Infrastructure layer

    # Create a folder for all test projects
    New-Item -ItemType Directory -Name "Tests"
    Set-Location -Path "Tests"

    # Create test projects using xUnit in the Tests folder
    dotnet new xunit -n "$projectName.Api.Tests"            # Api test project
    dotnet new xunit -n "$projectName.Domain.Tests"         # Domain test project
    dotnet new xunit -n "$projectName.Application.Tests"    # Application test project
    dotnet new xunit -n "$projectName.Infrastructure.Tests" # Infrastructure test project

    # Return to the root folder
    Set-Location -Path ..

    if ($addBlazor -eq "yes" || $addBlazor -eq "y") {
        dotnet new blazorwasm -n "$projectName.BlazorClient"
    }

    # Add main projects to the solution
    dotnet sln "$projectName.sln" add "$projectName.Api/$projectName.Api.csproj"
    dotnet sln "$projectName.sln" add "$projectName.Domain/$projectName.Domain.csproj"
    dotnet sln "$projectName.sln" add "$projectName.Application/$projectName.Application.csproj"
    dotnet sln "$projectName.sln" add "$projectName.Infrastructure/$projectName.Infrastructure.csproj"

    # Add test projects to the solution
    dotnet sln "$projectName.sln" add "Tests/$projectName.Api.Tests/$projectName.Api.Tests.csproj"
    dotnet sln "$projectName.sln" add "Tests/$projectName.Domain.Tests/$projectName.Domain.Tests.csproj"
    dotnet sln "$projectName.sln" add "Tests/$projectName.Application.Tests/$projectName.Application.Tests.csproj"
    dotnet sln "$projectName.sln" add "Tests/$projectName.Infrastructure.Tests/$projectName.Infrastructure.Tests.csproj"

    # Add BlazorClient to the solution (if chosen)
    if ($addBlazor -eq "yes" || $addBlazor -eq "y") {
        dotnet sln "$projectName.sln" add "$projectName.BlazorClient/$projectName.BlazorClient.csproj"
    }

    # Set up dependencies
    dotnet add "$projectName.Api/$projectName.Api.csproj" reference "$projectName.Application/$projectName.Application.csproj"
    dotnet add "$projectName.Application/$projectName.Application.csproj" reference "$projectName.Domain/$projectName.Domain.csproj"
    dotnet add "$projectName.Infrastructure/$projectName.Infrastructure.csproj" reference "$projectName.Application/$projectName.Application.csproj"

    # Set up test project dependencies
    dotnet add "Tests/$projectName.Api.Tests/$projectName.Api.Tests.csproj" reference "$projectName.Api/$projectName.Api.csproj"
    dotnet add "Tests/$projectName.Domain.Tests/$projectName.Domain.Tests.csproj" reference "$projectName.Domain/$projectName.Domain.csproj"
    dotnet add "Tests/$projectName.Application.Tests/$projectName.Application.Tests.csproj" reference "$projectName.Application/$projectName.Application.csproj"
    dotnet add "Tests/$projectName.Infrastructure.Tests/$projectName.Infrastructure.Tests.csproj" reference "$projectName.Infrastructure/$projectName.Infrastructure.csproj"

    # Add NuGet packages (examples)
    # Main projects
    # API Layer
    dotnet add "$projectName.Api/$projectName.Api.csproj" package Microsoft.AspNetCore.OpenApi
    dotnet add "$projectName.Api/$projectName.Api.csproj" package Microsoft.EntityFrameworkCore.Design
    dotnet add "$projectName.Api/$projectName.Api.csproj" package Swashbuckle.AspNetCore
    dotnet add "$projectName.Domain/$projectName.Domain.csproj" package FluentValidation
    dotnet add "$projectName.Application/$projectName.Application.csproj" package MediatR
    dotnet add "$projectName.Application/$projectName.Application.csproj" package AutoMapper
    # Infrastructure Layer
    dotnet add "$projectName.Infrastructure/$projectName.Infrastructure.csproj" package Microsoft.EntityFrameworkCore
    dotnet add "$projectName.Infrastructure/$projectName.Infrastructure.csproj" package Microsoft.EntityFrameworkCore.Design
    dotnet add "$projectName.Infrastructure/$projectName.Infrastructure.csproj" package Microsoft.EntityFrameworkCore.SqlServer

    # Test projects
    dotnet add "Tests/$projectName.Api.Tests/$projectName.Api.Tests.csproj" package Moq
    dotnet add "Tests/$projectName.Domain.Tests/$projectName.Domain.Tests.csproj" package FluentAssertions
    dotnet add "Tests/$projectName.Application.Tests/$projectName.Application.Tests.csproj" package FluentAssertions
    dotnet add "Tests/$projectName.Infrastructure.Tests/$projectName.Infrastructure.Tests.csproj" package Moq

    # BlazorClient (optional)
    if ($addBlazor -eq "yes") {
        dotnet add "$projectName.BlazorClient/$projectName.BlazorClient.csproj" package Microsoft.AspNetCore.Components.WebAssembly
        dotnet add "$projectName.BlazorClient/$projectName.BlazorClient.csproj" package System.Net.Http.Json
    }

    # Output confirmation
    Write-Host "Clean Architecture solution '$projectName' created successfully with test projects organized in the 'Tests' folder!"
    if ($addBlazor -eq "yes") {
        Write-Host "BlazorClient project added to the solution with NuGet packages!"
    }

    # Call the Create-Database function
    Create-Database -databaseName ($projectName + "Db")
}