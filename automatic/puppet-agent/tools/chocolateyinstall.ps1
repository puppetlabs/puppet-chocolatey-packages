$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.19.0-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.19.0-x64.msi'
$checksum32  = '2189cf3a2de14b1cf99f5015137b1088f95971c8c1d8342a83d4fe8a377558c3'
$checksum64  = '4c6366c6d90fa3bf97daa5e7110fe0943b3587b09d004f577636dd5ce0af8c3d'


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
