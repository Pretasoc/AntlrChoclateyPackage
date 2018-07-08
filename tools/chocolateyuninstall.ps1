$ErrorActionPreference = 'Stop';

Uninstall-BinFile -Name "antlr"
Remove-Item -Recurse "$env:ChocolateyInstall\lib\antlr4"