 function Run-Rewards {
    # Launch Edge with a URL
    $EdgeURL = 'https://www.bing.com'
    Start-Process -FilePath 'msedge.exe' -ArgumentList $EdgeURL -WindowStyle Maximized

    # Wait for Edge to load
    Start-Sleep -Seconds 5

    # Enable developer mode
    $wshell = New-Object -ComObject wscript.shell; $wshell.AppActivate('Bing - Microsoft Edge')
    $wshell.SendKeys('{F12}')

    # Wait for developer tools to load
    Start-Sleep -Seconds 5

    # Perform a search
    for ($i = 1; $i -le 30; $i++){
        $number = Get-Random -Minimum 0 -Maximum 101
        $wshell.SendKeys('{F6}')
        $wshell.SendKeys($number)
        $wshell.SendKeys('{ENTER}')

        Start-Sleep -Seconds 5
    }
}