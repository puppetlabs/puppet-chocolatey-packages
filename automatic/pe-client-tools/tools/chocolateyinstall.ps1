$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppetlabs.com/pe-client-tools/2018.1.8/18.1.8/repos/windows/pe-client-tools-18.1.8-x64.msi'
$checksum32  = ''
$checksum64  = 'afc5ee544d095a59670fcc6a4a60adfec6134bc8027b7e51bcf93783336c3a2c'

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
