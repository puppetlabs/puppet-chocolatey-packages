$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2019.8.2/19.8.4/repos/windows/pe-client-tools-19.8.4-x64.msi'
$checksum32  = ''
$checksum64  = '3a99d0dae68e54e20b52b38a42e33a9347198c7c7e0235a1951ff82386c15595'

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
