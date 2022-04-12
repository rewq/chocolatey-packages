
$ErrorActionPreference = 'Stop'; # stop on all errors

$url64      = 'https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.3.3&type=WindowsX64' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE' 
  softwareName  = 'Burp*' 

  url64bit      = 'https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.3.3&type=WindowsX64'
  checksum64    = 'ec36e4e087bca78950b27d33f97ab27102aee57ea66bd4540eb07ea7d4ea3934'
  checksumType64= 'sha256' #default is checksumType

  silentArgs   = '-q'           # Install4j
}

Install-ChocolateyPackage @packageArgs 


