$packageName = 'pe-client-tools'
$url32       = ''
$url64       = 'https://pm.puppet.com/pe-client-tools/2018.1.1/18.1.2/repos/windows/pe-client-tools-18.1.2-x64.msi'
$checksum32  = ''
$checksum64  = 'a71c3729df23cbc6e435077315cce00d01629ad69bd3501f054adfe234258ff4'

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
