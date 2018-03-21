$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.0-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.0-x64.msi'
$checksum32  = '2529f61459467e86bbd0b5d805ec83d174eb2da831d8c7262536344c3e96cb22'
$checksum64  = '47ad6fbcda16cc93840093bbae04166397fd22c2bfd98dc3ed8b16ff33a78908'


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
