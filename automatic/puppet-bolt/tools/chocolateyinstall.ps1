$packageName = 'puppet-bolt'
$url32       = ''
$url64       = 'https://downloads.puppet.com/windows/puppet-tools/puppet-bolt-3.15.0-x64.msi'
$filename32  = ''
$filename64  = 'puppet-bolt-3.15.0-x64_x64.msi'
$checksum32  = ''
$checksum64  = '169109F7B8FEB90FD76638BBFE9FBC2EE0CF3AE391332F460157770B9DB125A1'

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
