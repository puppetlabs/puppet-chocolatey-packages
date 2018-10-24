$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.7-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet5/puppet-agent-5.5.7-x64.msi'
$checksum32  = 'cc0e9d46e9c167e73e09d767ce46a93a67abab7499b8d7a8fb2e252bc474996d'
$checksum64  = '505c2129cf9a2129b1b9ce18fe92afe7746c0e1313b0d68a383f2c8fb6836555'


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
