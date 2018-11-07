$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.0.1/19.0.1/repos/windows/pe-client-tools-19.0.1-x64.msi'
$checksum32  = ''
$checksum64  = 'c1c2ba7514a85736609a8c50c8d0618e9b95851f6deb98b1f1f91f629c65cf83'

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
