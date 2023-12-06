 function Run-Rewards {
    # Launch Edge with a URL
    $EdgeURL = 'https://www.bing.com'
    Start-Process -FilePath 'msedge.exe' -ArgumentList $EdgeURL -WindowStyle Maximized

    # Wait for Edge to load
    Start-Sleep -Seconds 5

    # Enable developer mode
    $wshell = New-Object -ComObject wscript.shell; 
    $wshell.AppActivate('Bing')

    # Perform a search
    for ($i = 1; $i -le 30; $i++){
        $number = Get-Random -Minimum 10 -Maximum 101
        $wshell.SendKeys('{F6}')
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys('{F6}')
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys($number)
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys('{ENTER}')
        $result = "$i - $number"
        Write-Host($result)
        
        Start-Sleep -Seconds 10
    }
}