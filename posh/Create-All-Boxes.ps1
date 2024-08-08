#<#
#.Synopsis
#	Create all known boxes .
#.Description
#	Generates all known combination of boxes on the file share 
##>


param (	
  [string] $Comment = "",  
  [string] $WorkingFolder = "c:\work"
  )

if (!$env:VAGRANTBOXSHARE)
{
    Write-Error "VAGRANTBOXSHARE environment variable is not set. Add the folder share information."
    Exit 12
}

if ($Comment)
{
    $comment = $Comment
}
else {
    $comment = "Generated box on $(Get-Date)"
}

& ./Create-Jammy-Humble-Harmonic-Box.ps1 -Comment $comment
& ./Create-Jammy-Iron-Harmonic-Box.ps1 -Comment $comment
& ./Create-Noble-Jazzy-Harmonic-Box.ps1 -Comment $comment