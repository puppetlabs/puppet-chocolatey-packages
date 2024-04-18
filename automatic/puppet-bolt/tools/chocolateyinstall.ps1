$packageName = 'puppet-bolt'
$url32       = ''
$url64       = 'https://downloads.puppet.com/windows/puppet-tools/puppet-bolt-3.29.0-x64.msi'
$filename32  = ''
$filename64  = 'puppet-bolt-3.29.0-x64_x64.msi'
$checksum32  = ''
$checksum64  = '8609EC21378198FD3A499D5E6F45F0E2057F25A59A28FA6140B7602520E4378B'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'MSI'
  silentArgs     = "/qn /norestart"
  validExitCodes = @(0, 3010, 1641)
}

if ([string]::IsNullOrEmpty($filename32)) {
  # If 64bit only, then only use the file parameter
  $packageArgs['file'] = (Join-Path -Path $toolsDir -ChildPath $filename64)
} else {
  $packageArgs['file'] = (Join-Path -Path $toolsDir -ChildPath $filename32)
  $packageArgs['file64'] = (Join-Path -Path $toolsDir -ChildPath $filename64)
}

Install-ChocolateyInstallPackage @packageArgs
