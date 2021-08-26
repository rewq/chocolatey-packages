$ErrorActionPreference = 'Stop'

$packageName= $env:ChocolateyPackageName
$toolsDir   = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://phoenixnap.dl.sourceforge.net/project/echomirage.oldbutgold.p/EchoMirage-3.1.exe'
#$url64      = 'https://somewhere.com/file-x64.msi'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = $url
  #url64bit      = $url64
  silentArgs    = "/SILENT"
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'EchoMirage*'
  checksum      = '5D82C9F310E6AB06BD8DA1AAC05061E5A7667E471E048FF156E7EF73CE867F62'
  checksumType  = 'sha256'
  #checksum64    = '123356'
  #checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs