$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#4.1.16.1
$WebFileArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "${toolsDir}\smoketest_4_1.zip"
  url          = 'http://smoketest.wesleysteiner.com/smoketest_4_1.zip'
  checksum     = '2401A407AC56A1CEB2E89A663CE8097FF0884959F563C8755EB6CEBD0D28DE34'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @WebFileArgs

$UnzipArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath   = "${toolsDir}\smoketest_4_1.zip"
  Destination    = "${toolsDir}\smoketest_4_1"
}
Get-ChocolateyUnzip @UnzipArgs


$lnkDesktop = "$ENV:UserProfile\Desktop\.net SmokeTest 4.0.lnk"
Install-ChocolateyShortcut -ShortcutFilePath "$lnkDesktop" `
  -TargetPath "${toolsDir}\smoketest_4_1\SmokeTest.exe" `
  -IconLocation "${toolsDir}\icon.ico" `
  -WorkingDirectory "${toolsDir}\smoketest_4_1"

Remove-Item "$toolsDir\smoketest_4_1.zip"

$files = get-childitem "${toolsDir}\smoketest_4_1" -include *.exe -recurse

foreach ($file in $files) {
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}