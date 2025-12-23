function Invoke-BingRewardsSearch {
    <#
    .SYNOPSIS
        Automates Bing searches to accrue Microsoft Rewards points.
    #>
    [CmdletBinding()]
    param(
        [int]$TotalSearches = 30,
        [int]$SleepBetweenSearches = 6
    )

    $sw = [Diagnostics.Stopwatch]::StartNew()

    # Launch Edge
    $EdgeURL = 'https://www.bing.com'
    Write-Host "Launching Edge..." -ForegroundColor Cyan
    Start-Process -FilePath 'msedge.exe' -ArgumentList $EdgeURL -WindowStyle Maximized

    # Wait for Edge to load
    Start-Sleep -Seconds $SleepBetweenSearches

    $wshell = New-Object -ComObject wscript.shell

    # Generate unique random numbers
    $randomIntegers = Get-Random -InputObject (1..1000) -Count $TotalSearches | Select-Object -Unique

    for ($i = 0; $i -lt $randomIntegers.Count; $i++){
        # Refocus Edge to ensure keys aren't sent to the wrong app
        $wshell.AppActivate('Bing') | Out-Null
        Start-Sleep -Milliseconds 500

        # Use CTRL+E to focus the search bar (cleaner than F6)
        $wshell.SendKeys('^e')
        Start-Sleep -Milliseconds 200

        # Type the search term and Enter
        $wshell.SendKeys("$($randomIntegers[$i]){ENTER}")

        Write-Host "Search $($i+1)/$($TotalSearches): $($randomIntegers[$i])" -ForegroundColor Gray

        Start-Sleep -Seconds $SleepBetweenSearches
    }

    $sw.Stop()
    Write-Host "Finished! Total time: $($sw.Elapsed.Minutes)m $($sw.Elapsed.Seconds)s" -ForegroundColor Green
}