$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.15.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.15.0-x64.msi'
$checksum32  = '403fe3a4bedd15ff72bfd3fc4a6f662a4e75f9c8d0f538a4c7506606fea9cb7a'
$checksum64  = '997677d85253fa7c4276c7f1a6eb9d5e549ee5e45123267e81400e2a3ea39cc6'


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
