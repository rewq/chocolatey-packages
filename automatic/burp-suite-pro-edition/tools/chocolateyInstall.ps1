$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-pro-edition'
  fileFullPath = "${appDir}\burpsuite_pro.jar"
  url          = 'https://portswigger.net/burp/releases/download?product=pro&version=2021.8.2&type=Jar'
  checksum     = 'f8706df120be5478c6da361b316050e7b8423d9973f0b1a946de57c4085355a6'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
$env:ChocolateyPackageInstallLocation = $appDir

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "${menuPrograms}\Burp Suite Pro Edition.lnk"
  targetPath       = '%JAVA_HOME%\bin\javaw.exe'
  arguments        = "-jar `"${appDir}\burpsuite_pro.jar`""
  iconLocation     = "${toolsDir}\icon-pro.ico"
}
Install-ChocolateyShortcut @shortcutArgs