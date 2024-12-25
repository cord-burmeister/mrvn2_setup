#<#
#.Synopsis
#	Create a new Vagrant box file for a windows 11 environment 
#.Description
#	The Virtual machine configuration in the Hyper-V Manager 
# requires some post processing to be used as box in the vagrant 
# environment
#.Parameter BoxName
#    This is the name of the vagrant box which will be generated. This is also the name of the 
#    folder which contains the vagrant file which generates the default name of the VM in hyper-V
#.Parameter Comment
#    This is the comment which will be stored in the change log of the box files
#.Parameter WorkingFolder
#    This is the path to the folder in which the box will be created
#    and compressed intermediate files. 
##>

param (	
  [string] $BoxName = "win11",
  [string] $Comment = "",  
  [string] $WorkingFolder = "c:\work"
  )

  if (!$env:VAGRANTBOXSHARE)
  {
      Write-Error "VAGRANTBOXSHARE environment variable is not set. Add the folder share information."
      Exit 12
  }
$location = Get-Location

$VmName = "box-$BoxName"

& ./CreateWindowsBox.ps1 -BoxName $BoxName -VmName $VmName -WorkingFolder $WorkingFolder
Set-Location $location
