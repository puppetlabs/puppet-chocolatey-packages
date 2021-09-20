$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppetlabs.com/pe-client-tools/2021.3.0/21.3.0/repos/windows/pe-client-tools-21.3.0-x64.msi'
$checksum32  = ''
$checksum64  = '396f67cd60e24cf49a986f3844a3482a5e98b5602d3e91851fb67b49f38b54b2'

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
