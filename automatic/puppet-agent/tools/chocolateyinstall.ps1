$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.7.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.7.0-x64.msi'
$checksum32  = '9353c91290f0072a2e75143d0e4915641d71237b9c80bc009bbb4c7a07da1351'
$checksum64  = '9796cae41aebb2bc4e2c84c90266dae0af332d8f19d8bec10bf7793433f3f276'


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
