$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.6.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.6.0-x64.msi'
$checksum32  = '0804018fba5c3d72193936afc6fbbc789e716c270ac0345a95534cf02d65619e'
$checksum64  = 'f7300644ab19639731b7f14e441a45c4addc0e8228ade72db442af362c9306a3'


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
