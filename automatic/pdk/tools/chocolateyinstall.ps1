$packageName = 'pdk'
$url32       = ''
$url64       = 'https://downloads.puppet.com/windows/puppet6/pdk-2.5.0.0-x64.msi'
$checksum32  = ''
$checksum64  = 'ad81b9f89dbce407880a488320766aa85b1601c350569070a362d9d7a37c92cc'

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
