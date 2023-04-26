################################################################
######                   Themes                           ######
################################################################

function Light {
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name SystemUsesLightTheme -Value 1 -Type Dword -Force
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme -Value 1 -Type Dword -Force
}

function Dark {
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name SystemUsesLightTheme -Value 0 -Type Dword -Force
    Set-ItemProperty -Path HKCU:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize -Name AppsUseLightTheme -Value 0 -Type Dword -Force


}

function VSCodeDark{
    $settings = Get-Content "$env:APPDATA\Code\settings.json" | ConvertFrom-Json
    $settings."workbench.colorTheme" = "Visual Studio Dark"
    $setting | ConvertTo-Json -Depth 32 | Set-Content "$env:APPDATA\Code\settings.json"
}

function VSCodeLight{
    $settings = Get-Content "$env:APPDATA\Code\settings.json" -ErrorAction SilentlyContinue | ConvertFrom-Json
    if ($null -eq $settings.'workbench.colorTheme') {
        $settings.'workbench.colorTheme' = "Visual Studio Light"
    }
    #$settings."workbench.colorTheme" = "Visual Studio Light"
    $setting | ConvertTo-Json -Depth 32 | Set-Content "$env:APPDATA\Code\settings.json"
}

function LightWallpaper {
    $path = "C:\Users\m.senos\Pictures\star-wars-wallpaper-light(1).jpg"; 
    Set-ItemProperty -Path 'HKCU:\\Control Panel\\Desktop' -Name Wallpaper -Value $path; 
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}

function DarkWallpaper {
    $path = "C:\Users\m.senos\Pictures\star-wars-wallpaper-dark(1).jpg"; 
    Set-ItemProperty -Path 'HKCU:\\Control Panel\\Desktop' -Name Wallpaper -Value $path; 
    rundll32.exe user32.dll, UpdatePerUserSystemParameters
}