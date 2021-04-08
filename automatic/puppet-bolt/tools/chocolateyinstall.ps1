$packageName = 'puppet-bolt'
$url32       = ''
$url64       = 'https://downloads.puppet.com/windows/puppet-tools/puppet-bolt-3.6.1-x64.msi'
$filename32  = ''
$filename64  = 'puppet-bolt-3.6.1-x64_x64.msi'
$checksum32  = ''
$checksum64  = 'AF00BD1D61E5D38E2734205D2B6CF040F0744F5DBE770BE26959FF878263E6D0'

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
