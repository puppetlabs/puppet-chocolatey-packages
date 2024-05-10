$packageName = 'pdk'
$url64       = 'https://downloads.puppet.com/windows/puppet8/pdk-3.2.0.0-x64.msi'
$checksum64  = 'c2242bfb685c1fa6339812f862a174ec48a3c71cf3bc551dae4a5a843caf7263'

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
