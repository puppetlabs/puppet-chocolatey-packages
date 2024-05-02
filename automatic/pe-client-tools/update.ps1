import-module chocolatey-au

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
      "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
      "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

$ClientToolsRegex = 'pe-client-tools-(.+)-x64\.msi$'

Function ConvertTo-SortableVersionString($value) {
  $ver = $null
  try {
    $ver = [Version]::Parse($value)
  }
  catch {
    return $null
  }

  return $ver.Major.ToString('0000') + '.' + $ver.Minor.ToString('0000') + '.' + $ver.Build.ToString('0000')
}

Function ConvertFrom-SortableVersionString($value) {
  $ver = $null
  try {
    $ver = [Version]::Parse($value)
  }
  catch {
    return $null
  }

  return $ver.Major.ToString() + '.' + $ver.Minor.ToString() + '.' + $ver.Build.ToString()
}

Function ConvertTo-StreamVersion($value) {
  $ver = $null
  try {
    $ver = [Version]::Parse($value)
  }
  catch {
    return $null
  }

  return $ver.Major.ToString() + '.' + $ver.Minor.ToString()
}

function global:au_GetLatest {
  #https://pm.puppet.com/pe-client-tools/2018.1.0/18.1.0/repos/windows/pe-client-tools-18.1.0-x64.msi
  $streams = [ordered]@{}
  $VersionList = @{}
  #[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

  # Get the latest version
  $download_page = Invoke-WebRequest -Uri 'https://puppet.com/download-puppet-enterprise-client-tools' -UseBasicParsing
  $download_page.links | Where-Object { $_.href -match $ClientToolsRegex } | ForEach-Object {
    $fileUri = $_.href

    if ($matches.count -gt 0) { [void]$matches.clear }
    $fileUri -match $ClientToolsRegex | Out-Null
    $version = $matches[1]
    $VersionList.$version = $fileUri
  }

  # Get previous versions
  $download_page = Invoke-WebRequest -Uri 'http://downloads.puppet.com/enterprise/sources/' -UseBasicParsing
  $download_page.links | Where-Object { $_.href -match '^2\d{3,3}\.\d+.\d+$'} | ForEach-Object { Write-Output (ConvertTo-SortableVersionString -Value $_.href) } | Sort-Object -Descending | ForEach-Object {
    $PEVersion = ConvertFrom-SortableVersionString -Value $_
    $PEReleaseURI = 'https://www.puppet.com/releases/' + $PEVersion
    $files = $null
    try {
      $files = Invoke-WebRequest -URI $PEReleaseURI -UseBasicParsing
    } catch {
      $files = $null
    }

    if ($null -ne $files) {
      $files.links |
        # Example address https://pm.puppetlabs.com/pe-client-tools/2017.2.5/17.2.4/repos/windows/pe-client-tools-17.2.4-x64.msi
        Where-Object { $_.href -match $ClientToolsRegex} |
        ForEach-Object {
          $fileUri = $_.href

          if ($fileUri -ne '') {
            if ($matches.count -gt 0) { [void]$matches.clear }
            $fileUri -match $ClientToolsRegex | Out-Null
            $version = $matches[1]
            $VersionList.$version = $fileUri
          }
      }
    }
  }

  # Now we have a version list time to get the Stream versioning
  $VersionList.Keys | ForEach-Object { Write-Output (ConvertTo-SortableVersionString -Value $_) } | Sort-Object -Descending | ForEach-Object {
    $ClientToolsVersion = ConvertFrom-SortableVersionString -Value $_
    $StreamVersion = ConvertTo-StreamVersion -Value $ClientToolsVersion

    if (!$streams.Contains($StreamVersion)) {
      $streams.$StreamVersion = @{ URL64 = $VersionList[$ClientToolsVersion]; Version = $ClientToolsVersion }
    }
  }

  @{ Streams = $streams }
}

# PE Client Tools is a 64bit only package
Update-Package -ChecksumFor 64
