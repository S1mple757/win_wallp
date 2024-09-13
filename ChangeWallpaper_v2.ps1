# Define the path to the wallpaper image
$imagePath = "C:\temp\Wallp\ver01\polina-rytova-1dGMs4hhcVA-unsplash.jpg"

# Define the Windows API function to set the wallpaper
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

# Constants for SystemParametersInfo function
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x0001

# Call the SystemParametersInfo function to set the wallpaper
[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $imagePath, $SPIF_UPDATEINIFILE)
