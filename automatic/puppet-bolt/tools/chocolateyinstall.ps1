$packageName = 'puppet-bolt'
$url64       = 'https://downloads.puppet.com/windows/puppet-tools/puppet-bolt-3.29.0-x64.msi'
$checksum64  = '8609EC21378198FD3A499D5E6F45F0E2057F25A59A28FA6140B7602520E4378B'

$packageArgs = @{
  packageName     = $packageName
  fileType        = 'MSI'
  url64bit        = $url64
  checksum64      = $checksum64
  checksumTypes64 = 'sha256'
  silentArgs      = "/qn /norestart"
  validExitCodes  = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs
