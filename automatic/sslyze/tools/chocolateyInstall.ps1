$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition


$WebFileArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "${toolsDir}\sslyze.zip"
  url64bit          = 'https://github.com/nabla-c0d3/sslyze/releases/download/5.0.5/sslyze-5.0.5-exe.zip'
  checksum64     = '87afd78febdff2e855638811994a2821fb2d65bb9127c7b37db19d820c9225d0'
  checksumType64 = 'sha256'
}
Get-ChocolateyWebFile @WebFileArgs

$UnzipArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath   = Get-Item $toolsDir\sslyze.zip
  Destination    = "${toolsDir}"
}
Get-ChocolateyUnzip @UnzipArgs

Get-ChildItem $toolsDir\*.exe -Recurse -Exclude "sslyze.exe" | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" '' } }

Remove-Item $toolsDir\sslyze.zip
