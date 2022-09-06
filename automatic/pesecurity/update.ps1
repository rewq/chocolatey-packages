
import-module au

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $url = 'https://raw.githubusercontent.com/NetSPI/PESecurity/master/Get-PESecurity.psm1'
    
    $current_checksum = (gi .\tools\chocolateyInstall.ps1 | sls '\bchecksum\b') -split "=|'" | Select -Last 1 -Skip 1
    if ($current_checksum.Length -ne 64) { throw "Can't find current checksum" }
    $remote_checksum  = Get-RemoteChecksum $url

    $checksum = $current_checksum
    $version = Get-Date -Format "yyyy.M.d"

    if ($current_checksum -eq $remote_checksum) {
       throw 'Checksums match, cancelling install'
    } 

    @{
        URL32      = $url
        Version    = $version
        Checksum32 = $remote_checksum
    }
}

update -NoCheckChocoVersion -Checksumfor none