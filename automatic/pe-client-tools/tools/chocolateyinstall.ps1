$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.1.0/19.1.1/repos/windows/pe-client-tools-19.1.1-x64.msi'
$checksum32  = ''
$checksum64  = '5af28c78e9e8d1ac2750f5197ecf6d9ed5d54e032e261831a87c6d3a0e6db83d'

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
