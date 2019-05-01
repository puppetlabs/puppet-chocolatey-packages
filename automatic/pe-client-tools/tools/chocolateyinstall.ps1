$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.0.3/19.0.4/repos/windows/pe-client-tools-19.0.4-x64.msi'
$checksum32  = ''
$checksum64  = '204013bc2a78ee5e1e66e6c8f9e9606de6c8781ab98ff91c7424ab37b4ec950d'

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
