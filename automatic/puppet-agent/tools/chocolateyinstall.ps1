$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.6-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.6-x64.msi'
$checksum32  = 'f53ad644af4790d752baf9cf420ac065a800970765333477021b631279a20f7f'
$checksum64  = '6e419a73b7e55317eec05bf6a05a11dc46314c41eda0a922bc8d3146228715dd'


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
