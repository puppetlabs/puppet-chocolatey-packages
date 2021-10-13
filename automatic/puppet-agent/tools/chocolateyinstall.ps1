$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.12.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.12.0-x64.msi'
$checksum32  = '5a0269e4f6ae0b2f3bd7bb979f5e3934f10317e6298f61e30db1c56a08c9badb'
$checksum64  = 'b938aba2ccc72508e074e9115ec07dc38a7e5a1af5d1465e925667f19e3e6c79'


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
