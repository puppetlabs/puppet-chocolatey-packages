$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.15.0-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.15.0-x64.msi'
$checksum32  = '5976bdf19d23db4ee6f4a0121ba96c9536cc6779e996b9e2ec16c335caf85379'
$checksum64  = 'dc9357e1c9ac26ff4edc01efdf36619b6dd2b6fe05be98bb3d7b1aede1814493'


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
