$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppet.com/windows/puppet8/pdk-3.0.1.3-x64.msi'
$checksum32  = ''
$checksum64  = '301d9930c563c662f170b9b166390750ac2fd7193fe391e2a07ac39a64a051e7'

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
