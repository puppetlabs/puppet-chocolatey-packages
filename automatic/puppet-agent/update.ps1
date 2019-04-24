import-module au

# No trailing slash
# Order is important.  Most recent first
$downloadURLs = @('https://downloads.puppetlabs.com/windows/puppet6',
                  'https://downloads.puppetlabs.com/windows/puppet5',
                  'https://release-archives.puppet.com/downloads/windows/')

function global:au_BeforeUpdate() {
  # Download $Latest.URL32 / $Latest.URL64 in tools directory and remove any older installers.
  Get-RemoteFiles -Purge
}

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
        "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
        "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
        "(^[$]filename32\s*=\s*)('.*')" = "`$1'$($Latest.filename32)'"
        "(^[$]filename64\s*=\s*)('.*')" = "`$1'$($Latest.filename64)'"
        "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {

  $streams = [ordered]@{}

  $downloadURLs | % {
    $downloadURL = $_
    $download_page = Invoke-WebRequest -UseBasicParsing -Uri $downloadURL

    # Extract all of the puppet-agent versions
    # e.g. puppet-agent-1.0.0-x86.msi
    $re  = "puppet-agent-(\d+\.\d+\.\d+)-x(86|64).msi"
    $versionList = $download_page.links | ForEach-Object {
      if ($matches.count -gt 0) { [void]$matches.clear }
      if ($_ -match $re) {
        Write-Output ([System.Version]$matches[1])
      }
    } | Sort-Object -Descending | ForEach-Object {
      $ver = $_
      $minorVer = $ver.ToString(2)
      if (!$streams.Contains($minorVer)) {
        $streams.$minorVer = @{ URL32 = $downloadURL + '/puppet-agent-' + $ver.ToString() + '-x86.msi';
                                URL64 = $downloadURL + '/puppet-agent-' + $ver.ToString() + '-x64.msi';
                                Version = $ver.ToString()
        }
      }
    }

  }

  @{ Streams = $streams }
}

# As we download the MSIs, no need for Checksums
update -ChecksumFor none
