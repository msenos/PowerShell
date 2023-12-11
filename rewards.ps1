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
    $randomIntegers = Get-Random -InputObject (1..1000) -Count 30 | Select-Object -Unique

    for ($i = 0; $i -lt 30; $i++){
        $wshell.SendKeys('{F6}')
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys('{F6}')
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys($($randomIntegers[$i]))
        Start-Sleep -MilliSeconds 100
        $wshell.SendKeys('{ENTER}')
        Write-Host "$i - $($randomIntegers[$i])"
        
        Start-Sleep -Seconds 10
    }
}