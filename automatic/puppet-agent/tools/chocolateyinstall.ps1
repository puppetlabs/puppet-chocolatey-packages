$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.6.0-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.6.0-x64.msi'
$checksum32  = 'bd51e3454c9426ff65beec14d328cb975e6914f55d7b6f30dff4d3eca8d4b8cc'
$checksum64  = '6e50300e0380363dea5f866f38ba7dafb1ea65a4568c4367de8225f5b34e782c'


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
