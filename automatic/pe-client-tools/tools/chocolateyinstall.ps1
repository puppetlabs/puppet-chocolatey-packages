$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.2.0/19.2.2/repos/windows/pe-client-tools-19.2.2-x64.msi'
$checksum32  = ''
$checksum64  = '74086d209f60a4c6cb251e106ba27c250b8244b3b703a65974407c111426a0c6'

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
