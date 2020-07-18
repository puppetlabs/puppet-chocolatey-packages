$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/pdk-1.18.1.0-x64.msi'
$checksum32  = ''
$checksum64  = '50a4c0e000117950b6c498b9b9f165b36efc582c0f8eb9df95c65d4cccdbfd04'

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
