$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.10.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet8/puppet-agent-8.10.0-x64.msi'
$checksum32  = '8e1c7501d90ffdffa9a4e5e9db29986c08ac0b08f2dbd6c2292d0acab9974eff'
$checksum64  = 'f47c4ec0ddef7dff097fd77e7c74610297ba4233be7e9ee6a366c106f6437459'


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
