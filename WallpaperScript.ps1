$text = @"

 ______     ______     ______     ______    
/\  ___\   /\  __ \   /\  __ \   /\  ___\   
\ \___  \  \ \  __ \  \ \  __ \  \ \  __\   
 \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
  \/_____/   \/_/\/_/   \/_/\/_/   \/_____/ 
                                            

"@
echo $text
cd <Path To Directory>
sleep(2)
echo GettingImage...
curl -O image.jpg <url-of-image>
echo Done!
sleep(2)
echo SettingWallpaper...
$setwallpapersrc = @"
using System.Runtime.InteropServices;

public class Wallpaper
{
  public const int SetDesktopWallpaper = 20;
  public const int UpdateIniFile = 0x01;
  public const int SendWinIniChange = 0x02;
  [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
  private static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
  public static void SetWallpaper(string path)
  {
    SystemParametersInfo(SetDesktopWallpaper, 0, path, UpdateIniFile | SendWinIniChange);
  }
}
"@
Add-Type -TypeDefinition $setwallpapersrc

[Wallpaper]::SetWallpaper("C:\Path\image.jpg")

sleep(2)
echo Done!
$host.SetShouldExit(0)


<#
You can add $path=args[0] and here [Wallpaper]::SetWallpaper($path)

You then would call the script like this: 

imagedwl.ps1 C:\wallpapers\Wallpaper.jpg
#>




























