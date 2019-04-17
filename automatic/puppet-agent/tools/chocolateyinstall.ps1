$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.4.1-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.4.1-x64.msi'
$checksum32  = '5ecbf0e28fa8d300fc50b9468a48d7cb456b15febc5a1aff8f2a04ac9ee95e6d'
$checksum64  = '9549a3bd671d8f5d64c82f661b54ae0dd472ab17abe48b828169ca289a09ab39'


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
