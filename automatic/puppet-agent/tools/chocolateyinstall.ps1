$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.0.2-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.0.2-x64.msi'
$checksum32  = '54fadd8481eda8fd0da91f0816a93767492b5e1563be5cee33aba561c2d3f4e3'
$checksum64  = '4a69452cd099e525155dd63dbeab40bf31d6e4e11ad2c142cd49d4bf434ecf84'


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
