$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.5.1-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.5.1-x64.msi'
$checksum32  = '2ed0c56113f05c4b6609a69fe218c01c0dc87803fc453d07454a824a6d791731'
$checksum64  = '85843260a004f6165e0a7732dfcfb1a10bf1e329356e864795dde63a87c99377'


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
