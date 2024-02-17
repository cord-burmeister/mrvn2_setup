#<#
#.Synopsis
#	Create a new Vagrant box file out of a Hyper-V machine
#.Description
#	The Virtual machine configuration in the Hyper-V Manager 
# requires some post processing to be used as box in the vagrant 
# environmetn
#.Parameter BoxName
#    This is the name of the vagrant box which will be generated
#.Parameter VmName
#    This is the name of the Hyper-V source virtual machine, when set.
#    Otherwise it will be using the VMs which starts with  'vagrant-windows_default'
#.Parameter WorkingFolder
#    This is the path to the folder in which the box will be created
#    and compressed intermediate files. 
#.Example
#	Create a box file from the Hyper-V machine server2022
# CreateVagrantBox -VmName server2022
##>

param (	
  [string] $BoxName = "ros2humble",
  [string] $VmName = "",
  [string] $WorkingFolder = "c:\work"
  )

$location = Get-Location

$FullBoxName = "marvin/$BoxName"
Write-Host "Generate the box with name $FullBoxName from VMs $VmName in folder $WorkingFolder"

Set-Location $PSScriptRoot/../windows-box-vagrant
& "vagrant destroy -f "
& "vagrant up" 

Set-Location $location

& ./CreateVagrantBox.ps1

& ./CreateVagrantBox.ps1


