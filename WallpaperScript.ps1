$text = @"

 ______     ______     ______     ______    
/\  ___\   /\  __ \   /\  __ \   /\  ___\   
\ \___  \  \ \  __ \  \ \  __ \  \ \  __\   
 \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
  \/_____/   \/_/\/_/   \/_/\/_/   \/_____/ 
                                            

"@
$wallpapersList = @(
'url1',
'url2',
'url3',
'url4',
'urlN'
)

$randomChoice = Get-Random -InputObject $wallpapersList
cls
Write-Host $text
cd <Path To Directory>
Start-Sleep(2)
Write-Host GettingImage...
curl -O image.jpg randomChoice
Write-Host Done!
Start-Sleep(2)
Write-Host SettingWallpaper...
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

Start-Sleep(2)
Write-Host Done!
$host.SetShouldExit(0)


<#
You can add $path=args[0] and here [Wallpaper]::SetWallpaper($path)

You then would call the script like this: 

imagedwl.ps1 C:\wallpapers\Wallpaper.jpg
#>




























