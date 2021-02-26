$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppet.com/windows/puppet6/pdk-2.0.0.0-x64.msi'
$checksum32  = ''
$checksum64  = 'b3f53346c5a2d25c0c20463491ef391f62b5b21f088134c9bd42c804766c5df9'

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
