[CmdletBinding()]
param (
    
    [switch]$d
)
hexo clean
hexo g
if ($d -eq $false) {
    hexo s
}else {
    hexo d
}