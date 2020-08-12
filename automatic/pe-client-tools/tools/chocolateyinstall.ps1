$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.8.1/19.8.2/repos/windows/pe-client-tools-19.8.2-x64.msi'
$checksum32  = ''
$checksum64  = '1fbba2c5dfec61ab7907aac89da824b6f02fdb5fc903b2e72f218ca3b67c2895'

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
