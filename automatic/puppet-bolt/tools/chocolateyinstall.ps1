$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileLocation = Join-Path $toolsDir 'puppet-bolt-3.5.0-x64_x64.msi'
$helpers = Join-Path $toolsDir 'helpers.ps1'

. $helpers

$pp = Get-PackageParameters

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  softwareName   = 'Puppet Bolt*'
  file           = $fileLocation
  fileType       = 'msi'
  silentArgs     = "/qn /norestart /l*v `"$env:TEMP\$env:ChocolateyPackageName.$env:ChocolateyPackageVersion.log`""
  validExitCodes = @(0, 1641, 3010)
  checksum       = 'FBBF91F0EFEBC61F24D0AE4FF067E6504624406ADE960727862EE74C61B29CE1'
  checksumType   = 'sha256'
  destination    = $toolsDir
}

Install-ChocolateyInstallPackage @packageArgs

#Put Bolt on the Machine Path, as opposed to User. This is good for C4B customers running Background Mode, as the User PATH is in Agent context, causing issues.
if (-not $pp['InstallOnUserPath']) {
  Remove-PathVariable -VariableToRemove "C:\Program Files\Puppet Labs\Bolt\bin"
  $PathArgs = @{
    PathToInstall = 'C:\Program Files\Puppet Labs\Bolt\bin'
    PathType      = 'Machine'
  }

  Install-ChocolateyPath @PathArgs
}