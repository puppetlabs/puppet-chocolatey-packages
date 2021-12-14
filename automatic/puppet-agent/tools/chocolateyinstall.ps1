$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.13.1-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.13.1-x64.msi'
$checksum32  = 'b46bcce01af1f5fc3ddf6767dd03176f6b84a7bf9d4843733dbcdf7ad9e2b455'
$checksum64  = '57176d6ab360a20c1f2c8d9a36232c664c74cbef95a24bcbd43fd90b54fca94a'


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
