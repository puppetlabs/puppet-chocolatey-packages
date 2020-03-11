$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.4.0/19.4.0/repos/windows/pe-client-tools-19.4.0-x64.msi'
$checksum32  = ''
$checksum64  = 'e4b7d3a441fceec47fdb7333ae70e0b4c410f05a2ed0e979c37f2e14a4188234'

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
