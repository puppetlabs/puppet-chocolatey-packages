﻿$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppetlabs.com/pe-client-tools/2021.6.0/21.6.0/repos/windows/pe-client-tools-21.6.0-x64.msi'
$checksum32  = ''
$checksum64  = '19ce78b5a4d07bf46ab568cb825d692fa883fc0a36aaad7516d6b648e66a4c5b'

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
