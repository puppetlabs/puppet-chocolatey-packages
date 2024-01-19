$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.4.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.4.0-x64.msi'
$checksum32  = '55b2dcea5f654b61caeef42ebaa2925c6cb4b63b56dcc52892c56125ff0475d1'
$checksum64  = '0def0034c5557eda82ee3872b9e74642c93f080b252abc70abc6f3eaf859c9e6'


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
