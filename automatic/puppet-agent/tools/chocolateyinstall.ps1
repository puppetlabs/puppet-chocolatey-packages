$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.4.1-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.4.1-x64.msi'
$checksum32  = '5a2df8f0e3049c1fe5afa9dce1f1d60d236ce46a79e4d1b0e52014ec4a2325b0'
$checksum64  = '5dec295a4886ff23dbaf20dc950e13003b72750d9893a983614900e319403df9'


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
