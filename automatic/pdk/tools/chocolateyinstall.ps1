$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppet.com/windows/puppet6/pdk-2.1.0.0-x64.msi'
$checksum32  = ''
$checksum64  = '8f6fe4bc98a8821b081b969de0c70d9a7940b90eb5420640eb4ea8cb7bf7af54'

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
