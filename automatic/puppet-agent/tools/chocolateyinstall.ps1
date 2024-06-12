$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.7.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.7.0-x64.msi'
$checksum32  = 'db9ac733f833e89af12b365c31f3ca732500b08dd443a84f7a5c11fe5c038831'
$checksum64  = 'aee29a44d62fbfdc1a886b5cd15ec50bdc0d1e2626e754cc37e32c457c3388b1'


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
