$packageName = 'puppet-bolt'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-bolt-1.47.0-x64.msi'
$filename32  = ''
$filename64  = 'puppet-bolt-1.47.0-x64_x64.msi'
$checksum32  = ''
$checksum64  = '5CDF9FCEEE5690E6ABCD56270270A1E97D9E383AB19D301884F6504D298E5636'

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
