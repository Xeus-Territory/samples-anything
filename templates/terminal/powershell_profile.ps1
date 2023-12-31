# Set the autosuggestion in pwsh
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource Histor

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Set the autosuggestion git in pwsh
Add-PoshGitToProfile -AllHosts -Force