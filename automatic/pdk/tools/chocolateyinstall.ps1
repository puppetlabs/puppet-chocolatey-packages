$packageName = 'pdk'
$url64       = 'https://downloads.puppet.com/windows/puppet8/pdk-3.2.0.1-x64.msi'
$checksum64  = 'ea8ce333a327dd31d448331155c7eee49183cde7f2f4967910a35531cedfae52'

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
