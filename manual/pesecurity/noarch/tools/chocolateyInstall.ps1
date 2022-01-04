$systemModuleDir = "$Env:ProgramFiles\WindowsPowerShell\Modules"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "${systemModuleDir}\Get-PESecurity\Get-PESecurity.psm1"
  url          = 'https://raw.githubusercontent.com/NetSPI/PESecurity/master/Get-PESecurity.psm1'
  checksum     = 'B49DA41B07E97BDBB92B82EA9F5A5079BDAB1E1375BD4570B430651A456A9F4D'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
