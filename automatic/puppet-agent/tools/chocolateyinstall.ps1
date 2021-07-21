$packageName = 'puppet-agent'
$url32       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.9.0-x86.msi'
$url64       = 'https://downloads.puppet.com/windows/puppet7/puppet-agent-7.9.0-x64.msi'
$checksum32  = '83044bf3f8c708f18b13d6c3e9ed77d8e2be92799ce956d0aaa2087bdedcbb0a'
$checksum64  = 'b29d45bef481066b4b1222d6234a329daae1b371a7a491e772a3223e7ffa9f5f'


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
