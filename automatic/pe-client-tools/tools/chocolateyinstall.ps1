$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.1.1/19.1.3/repos/windows/pe-client-tools-19.1.3-x64.msi'
$checksum32  = ''
$checksum64  = 'ffc838b084bbd138707d94ab8ffb22b79cbea9c4856b369461cbc7c3c39d6827'

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
