$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/pdk-1.8.0.0-x64.msi'
$checksum32  = ''
$checksum64  = '635a1daa2f004d32fe2feb8dbc990e7d62ff1834f6d107e1c4ce760f7181e955'

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
