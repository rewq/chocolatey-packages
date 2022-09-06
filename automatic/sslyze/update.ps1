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
    $repo = "nabla-c0d3/sslyze"
    $releases = "https://api.github.com/repos/$repo/releases"
    $tag = (Invoke-WebRequest $releases | ConvertFrom-Json)[0].tag_name

    $url = "https://github.com/$repo/releases/download/$tag/sslyze-$tag-exe.zip"
    $version = $tag
    $realseNotesURL = "https://github.com/$repo/releases/download/$tag/"

    return @{
        URL64        = $url
        Version      = $version
        ReleaseNotes = $releaseNotesURL
    }
}

update -ChecksumFor 64 
