$packageName = 'puppet-bolt'
$url64       = 'https://downloads.puppet.com/windows/puppet-tools/puppet-bolt-3.28.0-x64.msi'
$checksum64  = 'E985094B52FA383F7D679FE5C1DAB870CBD63F07280CEAC13BC4C21F2B7198EC'

$packageArgs = @{
  packageName     = $packageName
  fileType        = 'MSI'
  url64bit        = $url64
  checksum64      = $checksum64
  checksumTypes64 = 'sha256'
  silentArgs      = "/qn /norestart"
  validExitCodes  = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs
