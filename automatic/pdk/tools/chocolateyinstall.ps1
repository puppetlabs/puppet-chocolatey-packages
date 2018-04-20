$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/pdk-1.4.1.2-x64.msi'
$checksum32  = ''
$checksum64  = 'fd6a2b142f72eda3091c8d6799b1444a7219013d905e61b3f7852e3dc07946a2'

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
