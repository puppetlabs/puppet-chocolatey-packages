$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.18.0-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.18.0-x64.msi'
$checksum32  = 'c7c8dd94565ae6083149a71de32a2baebf864dd604f92f533b9bc6421021b054'
$checksum64  = '800ec44330ba94632a1ce1ecd78b61a07eebd99a18fd2ab42fe12c3b4cecd24a'


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
