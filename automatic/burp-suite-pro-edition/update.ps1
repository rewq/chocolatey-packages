import-module au

$releases    = 'https://portswigger.net/burp/releases/data#professional'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $releases = Invoke-WebRequest -Uri https://portswigger.net/burp/releases/data#professional -UseBasicParsing | ConvertFrom-Json
    $latestRelease = $releases.ResultSet.Results[0]
    $latestBuild = $latestRelease.Builds | Where-Object -FilterScript {$_.ProductPlatform -eq "WindowsX64" -and $_.ProductId -eq "pro"}

    $version = $latestBuild.Version
    $relurl = $latestRelease.url
    $url="https://portswigger.net/burp/releases/startdownload?product=pro&version=${version}&type=WindowsX64"
    $releaseNotesURL = "https://portswigger.net${relurl}"

    return @{
        URL64        = $url
        Version      = $version
        ReleaseNotes = $releaseNotesURL
    }
}

update 
