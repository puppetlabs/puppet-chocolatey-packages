$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.8.1-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.8.1-x64.msi'
$checksum32  = '6e8a0f0e72139984d48204e1242ed0d47025b8f686649ee18ae89bdc80a8f8c3'
$checksum64  = '19ab5a442fe54e859e13293861dcce7c1848b7ce43ceb121d2df04b74da3df37'


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
