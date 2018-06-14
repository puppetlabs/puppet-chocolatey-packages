$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppetlabs.com/pe-client-tools/2017.3.8/17.3.6/repos/windows/pe-client-tools-17.3.6-x64.msi'
$checksum32  = ''
$checksum64  = 'e1678ca473cde3d02d8d18087f334aa525fe37d3ec497154caa467434b66603a'

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
