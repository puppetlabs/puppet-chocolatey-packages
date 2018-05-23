import-module au

# No trailing slash
# Order is important.  Most recent first
$downloadURLs = @('https://downloads.puppetlabs.com/windows')

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {

  $streams = [ordered]@{}

  $downloadURLs | % {
    $downloadURL = $_
    $download_page = Invoke-WebRequest -Uri $downloadURL

    # Extract all of the puppet-bolt versions
    # e.g. puppet-bolt-0.20.3-x64.msi
    $re  = "puppet-bolt-(\d+\.\d+\.\d+)-x(86|64).msi"
    $versionList = $download_page.links | % {
      if ($matches.count -gt 0) { [void]$matches.clear }
      if ($_ -match $re) {
        Write-Output ([System.Version]$matches[1])
      }
    } | Sort -Descending | % {
      $ver = $_
      $minorVer = $ver.ToString(2)
      if (!$streams.Contains($minorVer)) {
        $streams.$minorVer = @{ URL64 = $downloadURL + '/puppet-bolt-' + $ver.ToString() + '-x64.msi';
                                Version = $ver.ToString()
        }
      }
    }

  }

  @{ Streams = $streams }
}

# Bolt is a 64bit only package
update -ChecksumFor 64
