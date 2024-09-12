$packageName = 'pdk'
$url64       = 'https://downloads.puppet.com/windows/puppet8/pdk-3.3.0.0-x64.msi'
$checksum64  = '52d4abbcc9faf194daaccb3534d8bb6789980b3cf674d33eb9f23e68a48cdfce'

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
