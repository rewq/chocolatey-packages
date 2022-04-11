$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$appDir = "${toolsDir}\app"

$packageArgs = @{
  packageName  = 'burp-suite-pro-edition'
  fileFullPath = "${appDir}\burpsuite_pro.jar"
  url          = 'https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.3.3&type=Jar'
  checksum     = ''
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
$env:ChocolateyPackageInstallLocation = $appDir

$menuPrograms = [environment]::GetFolderPath([environment+specialfolder]::Programs)
$shortcutArgs = @{
  shortcutFilePath = "${menuPrograms}\Burp Suite Pro Edition.lnk"
  targetPath       = '%JAVA_HOME%\bin\javaw.exe'
  arguments        = "--add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED -jar `"${appDir}\burpsuite_pro.jar`""
  iconLocation     = "${toolsDir}\icon.ico"
}
Install-ChocolateyShortcut @shortcutArgs
