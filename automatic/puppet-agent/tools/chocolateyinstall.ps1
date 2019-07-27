$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.7.2-x86.msi'
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-agent-6.7.2-x64.msi'
$checksum32  = 'ebc9d5caf8ff72690cb279822377ef30de2f490c5a08064952cc1cfc633eebfd'
$checksum64  = 'cf8317ba1ff55abf5ae55f1938d761fb4d808087fbb7e24d691d47d7434f7af2'


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
