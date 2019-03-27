$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.4.0-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.4.0-x64.msi'
$checksum32  = '412852e66e35603eb1bc6f1d2caf32aa2d2779b2bb32bb7c0307132cf7a3cf22'
$checksum64  = '4860ddc31807c01417dc5dcb1be77c4cdaa0899a088badb912d5ee53180e9b26'


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
