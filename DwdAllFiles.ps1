<# 
 ______     ______     ______     ______    
/\  ___\   /\  __ \   /\  __ \   /\  ___\   
\ \___  \  \ \  __ \  \ \  __ \  \ \  __\   
 \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
  \/_____/   \/_/\/_/   \/_/\/_/   \/_____/                                             
 #>

<#
This is an overkill script used for downloading all files from a directory using SimpleHTTPServer
created by TheWaWar: https://github.com/TheWaWaR/simple-http-server.

Directory names must be the same in the local computer as in the remote machine where the HTTP server is running. 
You can only download all files by entering the number of files you can see when you run the HTTP server.

#>



$direc = Read-Host 'Enter directory name: '
New-Item -Path . -Name $direc -ItemType Directory
$url  = 'http://192.168.100.26:8000/.../...'+$direc+'/'
$numFiles = Read-Host 'Enter number of files: ' 
$outputdir = 'C:\Users\Username\...\...\'+$direc

$WebResponse = Invoke-WebRequest -Uri $url

$WebResponse.Links | Select-Object -ExpandProperty href -Skip 1 | ForEach-Object {
    Write-Host "Downloading file '$_'"
	$fileUrl  = '{0}{1}' -f $url.TrimEnd('/'), $_
	$fileUrl >> Links.txt
}

Get-Content -Path Links.txt -Tail $numFiles > Links2.txt
Remove-Item Links.txt

$list = Get-Content -Path Links2.txt

foreach($urlx in $list) {
    $filename = [System.IO.Path]::GetFileName($urlx)
	$path = $outputdir + '\' + $filename
	$url1 = $url + $filename
	Invoke-WebRequest -Uri $url1 -OutFile $path
}
Remove-Item Links2.txt

