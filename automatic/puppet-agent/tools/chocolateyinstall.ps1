$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.2.0-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.2.0-x64.msi'
$checksum32  = '4f5367a0c7854643f53f5f9bcddd36c89b12c908acb360927f2f9b8c20d3ba4d'
$checksum64  = '4262bd1d2f77bd76e825c859ea9a48ead4e458103a0dd7474630322c37a9b40f'


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
