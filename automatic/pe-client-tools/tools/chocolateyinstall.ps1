$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppetlabs.com/pe-client-tools/2019.8.5/19.8.5/repos/windows/pe-client-tools-19.8.5-x64.msi'
$checksum32  = ''
$checksum64  = 'efa0eb382eef1d4e45aeb079b0dc8584c3c9dc049d416e4732318882bc22633c'

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
