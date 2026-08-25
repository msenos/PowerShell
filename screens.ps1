Add-Type -AssemblyName System.Windows.Forms

function FindWindow {
    param(
        [string]$ClassName,
        [string]$WindowTitle
    )

    # Define external function for finding windows
    Add-Type @"
      using System;
      using System.Runtime.InteropServices;
      public class Application {
          [DllImport("user32.dll")]
          public static extern IntPtr FindWindow(string lpClassName, string lpWindowName);
      }
"@

    # Return window handle
    return [Application]::FindWindow($ClassName,$WindowTitle)
}

# Define a function that uses pInvoke to move and resize windows
function Set-Window {
    param(
        [Parameter(Mandatory=$true)]
        $ProcessName,

        [Parameter(Mandatory=$false)]
        [int]$X,
        [Parameter(Mandatory=$false)]
        [int]$Y,
        [Parameter(Mandatory=$false)]
        [int]$Width,
        [Parameter(Mandatory=$false)]
        [int]$Height,
        [switch]$Passthru
    )

    # Get a handle for the window based on its title
    $window = FindWindow($null,$ProcessName)

    if ($window -eq 0) {
      return
    }

    # Define external functions for moving and showing windows
    Add-Type @"
      using System;
      using System.Runtime.InteropServices;
      public class Window {
          [DllImport("user32.dll")]
          public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
          [DllImport("user32.dll")]
          public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);
      }
"@

    # Move and show window
    if ($PSBoundParameters.ContainsKey('X') -and $PSBoundParameters.ContainsKey('Y') -and
      $PSBoundParameters.ContainsKey('Width') -and $PSBoundParameters.ContainsKey('Height')) {
      Window::MoveWindow($window,$X,$Y,$Width,$Height,$true)
    }
    
    Window::ShowWindowAsync($window,4)

}

function Start-SlackLayout {
  param(
    [int]$ScreenIndex = 1,
    [string]$SlackPath = (Join-Path $env:LOCALAPPDATA 'slack\slack.exe')
  )

  if (-not (Test-Path $SlackPath)) {
    throw "Slack was not found at $SlackPath"
  }

  $screens = [System.Windows.Forms.Screen]::AllScreens
  if ($ScreenIndex -lt 0 -or $ScreenIndex -ge $screens.Count) {
    throw "Screen index $ScreenIndex is not available. Detected $($screens.Count) screen(s)."
  }

  $app = Start-Process -FilePath $SlackPath -PassThru
  $app.WaitForInputIdle(10000)
  $app.Refresh()

  $attempts = 0
  while ($app.MainWindowHandle -eq 0 -and $attempts -lt 50) {
    Start-Sleep -Milliseconds 100
    $app.Refresh()
    $attempts++
  }

  if ($app.MainWindowHandle -eq 0) {
    throw "Slack did not expose a window handle in time."
  }

  $targetScreen = $screens[$ScreenIndex].WorkingArea
  Set-Window -ProcessName $app.MainWindowTitle -X $targetScreen.X -Y $targetScreen.Y -Width $targetScreen.Width -Height $targetScreen.Height
}

