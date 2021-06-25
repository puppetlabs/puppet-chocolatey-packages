$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppetlabs.com/pe-client-tools/2021.2.0/21.2.0/repos/windows/pe-client-tools-21.2.0-x64.msi'
$checksum32  = ''
$checksum64  = 'da57886240b5e03a99ef77ea27850e16bfd9d05741e976af80c9210f1de2fc25'

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
