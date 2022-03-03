$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppetlabs.com/pe-client-tools/2021.5.0/21.5.0/repos/windows/pe-client-tools-21.5.0-x64.msi'
$checksum32  = ''
$checksum64  = '91157e147568097239e3d72e9be7d3e182851e30d94ca07644372a4c846ce8c7'

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
