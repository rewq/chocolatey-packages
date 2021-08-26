$systemModuleDir = "$Env:ProgramFiles\WindowsPowerShell\Modules"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName
  fileFullPath = "${systemModuleDir}\Get-PESecurity\Get-PESecurity.psm1"
  url          = 'https://raw.githubusercontent.com/NetSPI/PESecurity/master/Get-PESecurity.psm1'
  checksum     = '7757F1B18CBB3B61F1D7C2A6137E1F46094AC1CB28CE27AE14AE1C86483C2444'
  checksumType = 'sha256'
}
Get-ChocolateyWebFile @packageArgs
