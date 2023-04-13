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
    if ($X -and $Y -and $Width -and $Height) {
      Window::MoveWindow($window,$X,$Y,$Width,$Height,$true)
    }
    
    Window::ShowWindowAsync($window,4)

}

# Start Slack with -Passthru option to get process info
$app = Start-Process "C:\Users\m.senos\AppData\Local\slack\slack.exe" -Passthru

# Wait for process ID to be available
while ( $null -eq $app.Id) {
  Start-Sleep -Milliseconds 100
}

# Get second screen resolution (assuming it is on right side of primary screen)
$screen_width = ([System.Windows.Forms.Screen]::AllScreens | Where-Object {$_.Primary}).WorkingArea.Width / 2
$screen_height = ([System.Windows.Forms.Screen]::AllScreens | Where-Object {$_.Primary}).WorkingArea.Height

# Move Slack window to second screen snapped to right side (assuming primary screen is on left side)
Set-Window -ProcessName "Slack" -X (3 * $screen_width) -Y 0 -Width $screen_width -Height $screen_height
