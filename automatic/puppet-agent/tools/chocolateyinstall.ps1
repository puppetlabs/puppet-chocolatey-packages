$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.3-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.3-x64.msi'
$checksum32  = '2639d48e140fdf53c65b054abaed4f676f29851ed9ef52d2828cb1a5402636d3'
$checksum64  = '1fef4287c84eff46754f3435b93beb173e72e6b26250b4529f4658836294822f'


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
