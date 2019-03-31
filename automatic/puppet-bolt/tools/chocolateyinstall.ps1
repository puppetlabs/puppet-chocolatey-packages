$packageName = 'puppet-bolt'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/puppet-bolt-1.15.0-x64.msi'
$checksum32  = ''
$checksum64  = 'ab2c8a335fbd3fa5240a24ebd7e99b5d3debeca7d2551aa52bc637dd45c3c7fa'

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
