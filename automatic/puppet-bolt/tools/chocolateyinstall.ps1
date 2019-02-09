$packageName = 'puppet-bolt'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/puppet-bolt-1.11.0-x64.msi'
$checksum32  = ''
$checksum64  = 'c5b55ead98a46b156d22b507e9affea88852fe80c5ab18898ba9b32fa5b3ff5f'

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
