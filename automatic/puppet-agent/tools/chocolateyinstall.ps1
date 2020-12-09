$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.0.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.0.0-x64.msi'
$checksum32  = 'd0416f05300a9fa27de225c82dcb1e9420f3f3988d6b274ea6d437cf257bbe65'
$checksum64  = '39e63671252c3899e30a1bbdd53160a21dc46e81e20b8a79028768370e9c12b3'


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
