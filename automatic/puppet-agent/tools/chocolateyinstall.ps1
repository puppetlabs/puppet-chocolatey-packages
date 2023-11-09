$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.3.1-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.3.1-x64.msi'
$checksum32  = '9f850aa2aa9cd32dedf1c2bc31d681365bc12d7197e4831c83eedcd45a514723'
$checksum64  = '1ca3bd2ca0b1cdf964c0d761cb0ddfa1ea4d941aaf4e3d6a6c8711b855eb2c4e'


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
