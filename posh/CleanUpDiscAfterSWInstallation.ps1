dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
dism.exe /online /Cleanup-Image /SPSuperseded

Remove-Item -path "C:\Windows\SoftwareDistribution\Download" -recurse -force
New-Item -itemtype Directory "C:\Windows\SoftwareDistribution\Download"

Write-Host  Remove Chocolatey cache directory from temp folder : $Env:Temp
$TempDir = $Env:Temp
if (Test-Path $TempDir\chocolatey -PathType Container)
{
    Remove-Item $TempDir\chocolatey -Recurse -Force
}

defrag c:
sdelete.exe -z c:
