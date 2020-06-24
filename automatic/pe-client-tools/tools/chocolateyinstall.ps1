$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.8.0/19.8.1/repos/windows/pe-client-tools-19.8.1-x64.msi'
$checksum32  = ''
$checksum64  = '6bf4f86ccb463376101822af525ac47f69eeb16a74b3bdca1d4007f1e9c37a94'

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
