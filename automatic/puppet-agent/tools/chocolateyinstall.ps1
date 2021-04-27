$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.6.1-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.6.1-x64.msi'
$checksum32  = 'da177834d590bba896d096c799b86e524908b3083c09c679ea1d733e3fe1dd80'
$checksum64  = 'a76ac4bff9e1011919da8fcc8581388cb288a101e056403917c2d7f88c72e5a7'


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
