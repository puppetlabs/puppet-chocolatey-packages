$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/pdk-1.10.0.0-x64.msi'
$checksum32  = ''
$checksum64  = 'd83c1a0e2be44b9d646f52c2d17504b92a06888c6f824a5b5a2c4783a46b31f4'

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
