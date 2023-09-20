$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.2.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.2.0-x64.msi'
$checksum32  = '3148a4b2ca198585a06ab325bdd10203acbf082e2b20f37409d7781a3e35e33e'
$checksum64  = 'eed34727debf14f09095bb328ddb1fad53f840dcb3008794f84586f164e7bcb3'


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
