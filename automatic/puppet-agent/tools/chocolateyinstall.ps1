$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.12.1-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.12.1-x64.msi'
$checksum32  = 'a4a7707923c394272d3e349459efd5414aac2d0a05cbf0b1d5f2537afd620211'
$checksum64  = 'b695f3fbacba08b99585a56bd91462c2d6a7495b9638800cc771ad920079d830'


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
