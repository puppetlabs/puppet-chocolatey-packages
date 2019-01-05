$packageName = 'puppet-bolt'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/puppet-bolt-1.8.1-x64.msi'
$checksum32  = ''
$checksum64  = '36b38bed26c332f32ced460863a05fb20d3f8a94adacd07db9e13edc02dc139c'

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
