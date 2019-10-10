$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/pdk-1.14.0.0-x64.msi'
$checksum32  = ''
$checksum64  = 'e0d7802e256369ade02452571eb9c8188411a39cfffd16bf8e3196974d5b3888'

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
