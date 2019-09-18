$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.9.0-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.9.0-x64.msi'
$checksum32  = 'e57d84e3f2adcf546b1e5381b9066c76da95eb581f07e7bea9d1b0ace31f3a68'
$checksum64  = '08f24ce737ac3eb59b32ed6d0a655e6c38c5ba6d2efe6139be86d8ff80d14aa0'


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
