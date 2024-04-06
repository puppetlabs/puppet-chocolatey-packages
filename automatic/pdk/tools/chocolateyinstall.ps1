$packageName = 'pdk'
$url64       = 'https://downloads.puppet.com/windows/puppet8/pdk-3.0.1.3-x64.msi'
$checksum64  = '301d9930c563c662f170b9b166390750ac2fd7193fe391e2a07ac39a64a051e7'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
