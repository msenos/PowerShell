# PowerShell script to turn on Night Light
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class NightLight {
    [DllImport("gdi32.dll", SetLastError = true)]
    private static extern bool SetDeviceGammaRamp(IntPtr hDC, ref RAMP lpRamp);

    [DllImport("user32.dll")]
    private static extern IntPtr GetDC(IntPtr hWnd);

    public struct RAMP {
        [MarshalAs(UnmanagedType.ByValArray, SizeConst=256)]
        public UInt16[] Red;
        [MarshalAs(UnmanagedType.ByValArray, SizeConst=256)]
        public UInt16[] Green;
        [MarshalAs(UnmanagedType.ByValArray, SizeConst=256)]
        public UInt16[] Blue;
    }

    public static void SetNightLight(bool enabled) {
        RAMP ramp = new RAMP();
        ramp.Red = new UInt16[256];
        ramp.Green = new UInt16[256];
        ramp.Blue = new UInt16[256];

        for(int i = 0; i < 256; i++) {
            int val = enabled ? (int)(i * 256 * 0.8) : i * 256;
            ramp.Red[i] = ramp.Green[i] = ramp.Blue[i] = (UInt16)val;
        }

        SetDeviceGammaRamp(GetDC(IntPtr.Zero), ref ramp);
    }
}
"@

function NightLight-On(){
    [NightLight]::SetNightLight($true)
}

function NightLight-Off(){
    [NightLight]::SetNightLight($true)
}
