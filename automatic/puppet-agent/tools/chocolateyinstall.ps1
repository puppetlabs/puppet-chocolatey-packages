$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.25.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.25.0-x64.msi'
$checksum32  = '0c42b22fc82b5cda1517b9f9b865f60be1d49bd2461e4c4660dca5ef5b40879a'
$checksum64  = 'f3c22a542971d2e5ff3b2d9f6da9a7f6191f30b9f2295c70d4d8d1a50b83d235'


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
