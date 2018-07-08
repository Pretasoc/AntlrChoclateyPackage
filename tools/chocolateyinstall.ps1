# IMPORTANT: Before releasing this package, copy/paste the next 2 lines into PowerShell to remove all comments from this file:
#   $f='c:\path\to\thisFile.ps1'
#   gc $f | ? {$_ -notmatch "^\s*#"} | % {$_ -replace '(^.*?)\s*?[^``]#.*','$1'} | Out-File $f+".~" -en utf8; mv -fo $f+".~" $f

# 1. See the _TODO.md that is generated top level and read through that
# 2. Follow the documentation below to learn how to create a package for the package type you are creating.
# 3. In Chocolatey scripts, ALWAYS use absolute paths - $toolsDir gets you to the package's tools directory.
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
# Internal packages (organizations) or software that has redistribution rights (community repo)
# - Use `Install-ChocolateyInstallPackage` instead of `Install-ChocolateyPackage`
#   and put the binaries directly into the tools folder (we call it embedding)
#$fileLocation = Join-Path $toolsDir 'NAME_OF_EMBEDDED_INSTALLER_FILE'
# If embedding binaries increase total nupkg size to over 1GB, use share location or download from urls
#$fileLocation = '\\SHARE_LOCATION\to\INSTALLER_FILE'
# Community Repo: Use official urls for non-redist binaries or redist where total package size is over 200MB
# Internal/Organization: Download from internal location (internet sources are unreliable)
$url        = 'https://www.antlr.org/download/antlr-4.7.1-complete.jar' # download url, HTTPS preferred


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath = "$env:ChocolateyInstall\lib\antlr4\antlr-4.7.1-complete.jar"
  url           = $url
  checksum      = 'F41DCE7441D523BAF9769CB7756A00F27A4B67E55AACAB44525541F62D7F6688'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Get-ChocolateyWebFile @packageArgs

Install-BinFile -Name "antlr" -Path "%JAVA_HOME%\java" -command "-jar %ChocolateyInstall%\lib\antlr4\antlr-4.7.1-complete.jar"