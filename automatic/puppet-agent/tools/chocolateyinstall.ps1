$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.19.1-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.19.1-x64.msi'
$checksum32  = '024e6084dd6f3a1b4d6bc5ccb97a73d7c43d0cda0a117b6eeb79a3f8a96f2350'
$checksum64  = 'a92f8d614ccc5300dac793d72cf875fa4c0ebebad9cd44248d5bf54b1d8b0a29'


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
