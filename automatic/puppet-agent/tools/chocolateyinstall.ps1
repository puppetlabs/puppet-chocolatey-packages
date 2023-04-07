$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.24.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.24.0-x64.msi'
$checksum32  = '8a79e3aa5e4948314a070cb04764b39bb5bc7988e6c6a78cb5e01c60f421469f'
$checksum64  = '8bbc78dda1dca772a7b269dbd856dda43d810ab34a49b6ec4971d3a6680e52ae'


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
