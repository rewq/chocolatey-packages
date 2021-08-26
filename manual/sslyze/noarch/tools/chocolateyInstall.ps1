$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = 'https://github.com/nabla-c0d3/sslyze/releases/download/4.1.0/sslyze-4.1.0-exe.zip'
  specificFolder = 'sslyze-4.1.0-exe'
  checksum      = 'F1AF2DCEDD0D247857A80CCE0D166436462FAB66F863C3D821F37FAA62F043F6'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
