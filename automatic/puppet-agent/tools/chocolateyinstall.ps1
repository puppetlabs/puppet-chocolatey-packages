$packageName = 'puppet-agent'
$url32       = 'http://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.4.0-x86.msi'
$url64       = 'http://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.4.0-x64.msi'
$checksum32  = 'a635082001513d4cb8ec7641fa7b974b63c479ef62eb81c04891d429fc97f0b4'
$checksum64  = '6a90a00ee373e8a2ebebd800d54bf77b657ff3a388a685fd01f27f820de761b6'


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
