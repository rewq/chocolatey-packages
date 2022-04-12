
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url64      = 'https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.3.3&type=WindowsX64' # 64bit URL here (HTTPS preferred) or remove - if installer contains both (very rare), use $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url64bit      = 'https://portswigger-cdn.net/burp/releases/download?product=pro&version=2022.3.3&type=WindowsX64'

  softwareName  = 'testy*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum      = 'ec36e4e087bca78950b27d33f97ab27102aee57ea66bd4540eb07ea7d4ea3934'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
  checksum64    = 'ec36e4e087bca78950b27d33f97ab27102aee57ea66bd4540eb07ea7d4ea3934'
  checksumType64= 'sha256' #default is checksumType

  silentArgs   = '-q'           # Install4j
}

Install-ChocolateyPackage @packageArgs # https://chocolatey.org/docs/helpers-install-chocolatey-package


