$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppet.com/windows/puppet6/pdk-2.3.0.0-x64.msi'
$checksum32  = ''
$checksum64  = '59429e41b3d4a4d562d3fe8c3cb65be88bdf981b7efae4540dbdb520f7520297'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url            = $url32
  url64bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
