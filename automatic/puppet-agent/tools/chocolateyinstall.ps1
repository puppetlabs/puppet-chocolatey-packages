$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.9.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.9.0-x64.msi'
$checksum32  = '1c55439d3f43d06e7c07573f14963d7025779eb6f3dc4d00a0a5aef40bf89135'
$checksum64  = '4f970ab8862430ff3755b7d5169f37b818e07baf401365719bff652c4321bc4e'


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
