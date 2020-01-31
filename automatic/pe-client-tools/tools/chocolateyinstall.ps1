$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.3.0/19.3.0/repos/windows/pe-client-tools-19.3.0-x64.msi'
$checksum32  = ''
$checksum64  = '0e94d8bdb9ee6b40c477c28b6f74ce02e06f691ac4ca2fd3b4985978c64ac54e'

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
