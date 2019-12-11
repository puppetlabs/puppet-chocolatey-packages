$packageName = 'puppet-bolt'
$url32       = ''
$url64       = 'https://downloads.puppetlabs.com/windows/puppet6/puppet-bolt-1.42.0-x64.msi'
$filename32  = ''
$filename64  = 'puppet-bolt-1.42.0-x64_x64.msi'
$checksum32  = ''
$checksum64  = 'DF0AE06D266A5C1C58A91676D61E8E6F86DA9EA6EB08DF952E4A94BC7914C395'

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
