$systemModuleDir = "$Env:ProgramFiles\WindowsPowerShell\Modules"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "${systemModuleDir}\Get-PESecurity\Get-PESecurity.psm1"
  url          = 'https://raw.githubusercontent.com/NetSPI/PESecurity/master/Get-PESecurity.psm1'
  checksum     = 'bb1b10602dc1a419ac77f720b582e6b4bef652596592faf754371ab8bb26602d'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
