$packageName = 'pdk'
$url64       = 'https://downloads.puppet.com/windows/puppet8/pdk-3.4.0.1-x64.msi'
$checksum64  = 'e547fc2ed546f8f987a1c185e91703a0c6ff9fffacab51644b25b0d7613acd37'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
