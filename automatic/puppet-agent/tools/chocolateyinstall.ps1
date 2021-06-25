$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.8.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.8.0-x64.msi'
$checksum32  = '67d5c7524ebfe07d70728d30b89dc2e7cce191cf7a8a6d34710a3df002a721cf'
$checksum64  = 'a4f6497ee26e653b9ece004c036bdf646cdf5ffdc86d624d34cb3bfae705b173'


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
