$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition


$WebFileArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "${toolsDir}\sslyze.zip"
  url          = 'https://github.com/nabla-c0d3/sslyze/releases/download/4.1.0/sslyze-4.1.0-exe.zip'
  checksum     = 'F1AF2DCEDD0D247857A80CCE0D166436462FAB66F863C3D821F37FAA62F043F6'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @WebFileArgs

$UnzipArgs = @{
  PackageName    = $env:ChocolateyPackageName
  SpecificFolder = "sslyze-*-exe"
  FileFullPath   = Get-Item $toolsDir\sslyze.zip
  Destination    = "${toolsDir}"
}
Get-ChocolateyUnzip @UnzipArgs

Get-ChildItem $toolsDir\*.exe -Recurse -Exclude "sslyze.exe" | ForEach-Object { Remove-Item $_ -ea 0; if (Test-Path $_) { Set-Content "$_.ignore" '' } }

Remove-Item $toolsDir\sslyze.zip
