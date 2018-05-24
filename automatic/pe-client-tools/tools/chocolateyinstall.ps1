$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2018.1.0/18.1.0/repos/windows/pe-client-tools-18.1.0-x64.msi'
$checksum32  = ''
$checksum64  = '31e876abf7b12ecaf8152fe8d5cd5e361198a69d13dabe09c6931d2185b48628'

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
