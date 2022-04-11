import-module au

$releases    = 'https://portswigger.net/burp/releases/data#professional'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $releases = Invoke-WebRequest -Uri https://portswigger.net/burp/releases/data#professional -UseBasicParsing | ConvertFrom-Json
    $latestRelease = $releases.ResultSet.Results[0]
    $latestBuild = $latestRelease.Builds | Where-Object -FilterScript {$_.ProductPlatform -eq "Jar" -and $_.ProductId -eq "pro"}

    $version = $latestBuild.Version
    $relurl = $latestRelease.url
    $url="https://portswigger-cdn.net/burp/releases/download?product=pro&version=${version}&type=Jar"
    $releaseNotesURL = "https://portswigger.net${relurl}"

    return @{
        URL32        = $url
        Version      = $version
        ReleaseNotes = $releaseNotesURL
    }
}

update -ChecksumFor none