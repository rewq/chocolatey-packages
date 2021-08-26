$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

#4.1.16.1
$WebFileArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "${toolsDir}\smoketest_2_3.zip"
  url          = 'http://smoketest.wesleysteiner.com/smoketest_2_3.zip'
  checksum     = 'B2A774ABAE2BDC769D59ED044E6C73E1D3456039183056AD03DF2328AE565ABC'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @WebFileArgs

$UnzipArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath   = "${toolsDir}\smoketest_2_3.zip"
  Destination    = "${toolsDir}\smoketest_2_3"
}
Get-ChocolateyUnzip @UnzipArgs


$lnkDesktop = "$ENV:UserProfile\Desktop\.net SmokeTest 2.0.lnk"
Install-ChocolateyShortcut -ShortcutFilePath "$lnkDesktop" `
  -TargetPath "${toolsDir}\smoketest_2_3\SmokeTest.exe" `
  -IconLocation "${toolsDir}\icon.ico" `
  -WorkingDirectory "${toolsDir}\smoketest_2_3"

Remove-Item "$toolsDir\smoketest_2_3.zip"

$files = get-childitem "${toolsDir}\smoketest_2_3" -include *.exe -recurse

foreach ($file in $files) {
  #generate an ignore file
  New-Item "$file.ignore" -type file -force | Out-Null
}