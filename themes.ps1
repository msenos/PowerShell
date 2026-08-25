################################################################
######                   Themes                           ######
################################################################

function LightTheme{
# Define the path to the registry key
$ThemeRegistryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

# Define the name of the registry value and the value for light theme
$ThemeRegistryValueName = "AppsUseLightTheme"
$LightThemeValue = 1

# Change the theme to light
Set-ItemProperty -Path $ThemeRegistryPath -Name $ThemeRegistryValueName -Value $LightThemeValue

}

function Light {
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name SystemUsesLightTheme -Value 1 -Type Dword -Force
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme -Value 1 -Type Dword -Force
}

function Dark {
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force
}

function VSCodeDark{
    $settingsPath = Join-Path $env:APPDATA 'Code\settings.json'
    $settings = Get-Content $settingsPath -Raw -ErrorAction Stop | ConvertFrom-Json
    $settings."workbench.colorTheme" = "Visual Studio Dark"
    $settings | ConvertTo-Json -Depth 32 | Set-Content $settingsPath
}

function VSCodeLight{
    $settingsPath = Join-Path $env:APPDATA 'Code\settings.json'
    if (-not (Test-Path $settingsPath)) {
        throw "VS Code settings file was not found: $settingsPath"
    }
    $settings = Get-Content $settingsPath -Raw -ErrorAction Stop | ConvertFrom-Json
    if ($null -eq $settings.'workbench.colorTheme') {
        $settings.'workbench.colorTheme' = "Visual Studio Light"
    }
    $settings | ConvertTo-Json -Depth 32 | Set-Content $settingsPath
}

function LightWallpaper {
    $path = Join-Path $env:USERPROFILE 'Pictures\star-wars-wallpaper-light(1).jpg'
    Set-ItemProperty -Path 'HKCU:\\Control Panel\\Desktop' -Name Wallpaper -Value $path; 
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

function DarkWallpaper {
    $path = Join-Path $env:USERPROFILE 'Pictures\star-wars-wallpaper-dark(1).jpg'
    Set-ItemProperty -Path 'HKCU:\\Control Panel\\Desktop' -Name Wallpaper -Value $path; 
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}