$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.14.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.14.0-x64.msi'
$checksum32  = '83e3f1bb82ce7b3d5c07f02f9c9994325733342b188e874f4f71b8d2ac12167b'
$checksum64  = '236a691a3d2d07ca01d73380551506a74f8e47ccb90bfada5c138ecf69335788'


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
