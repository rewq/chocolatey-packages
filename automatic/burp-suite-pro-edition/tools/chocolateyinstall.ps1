
$ErrorActionPreference = 'Stop'; # stop on all errors

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe' 
  softwareName  = 'Burp*' 

  url64bit      = 'https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.3.3&type=WindowsX64'
  checksumType64= 'sha256' 
  checksum64    = 'ec36e4e087bca78950b27d33f97ab27102aee57ea66bd4540eb07ea7d4ea3934'

  silentArgs   = '-q'           # Install4j
}

Install-ChocolateyPackage @packageArgs 
