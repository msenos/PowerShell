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
    $numbers = 1..1000 | Get-Random -Count 30 -Unique
    for ($i = 1; $i -le 30; $i++){
        $wshell.SendKeys('{F6}')
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys('{F6}')
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys($numbers[$i])
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys('{ENTER}')
        $result = "$i - $numbers[$i]"
        Write-Host($result)
        
        Start-Sleep -Seconds 10
    }
}