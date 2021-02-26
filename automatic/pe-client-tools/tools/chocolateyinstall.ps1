$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppetlabs.com/pe-client-tools/2021.0.0/21.0.0/repos/windows/pe-client-tools-21.0.0-x64.msi'
$checksum32  = ''
$checksum64  = '056afbf14a500650fdd86458a34435fb17c7a85c71a13f0719893e2b8263caae'

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
