$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.3.6-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.3.6-x64.msi'
$checksum32  = '90c33397f25cdc9dd7ab655beec584a0f85a93d825f2e5b0f93f73f028d756cf'
$checksum64  = '707f03e694509f4dfe78ec8c79068a1224ba60ea28e47eebba2e8e51cc419de5'


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
