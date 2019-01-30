$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.0.2/19.0.3/repos/windows/pe-client-tools-19.0.3-x64.msi'
$checksum32  = ''
$checksum64  = 'd8db5fc097fd0c0ed7fdf54d2acd85fbcb013383ba967e0355c50942f0ae1e38'

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
