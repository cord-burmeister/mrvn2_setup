
#<#
#.Synopsis
#	Install Visual Studio Code
#.Description
#	Install Visual Studio Code in a dedicated script so that we can reboot the machine after the installation
##>

# /NoDesktopIcon - Don't add a desktop icon.
# /NoQuicklaunchIcon - Don't add an icon to the QuickLaunch area.
# /NoContextMenuFiles - Don't add an Open with Code entry to the context menu for files.
# /NoContextMenuFolders - Dont't add an Open with Code entry to the context menu for folders.
# /DontAddToPath - Don't add Visual Studio Code to the system PATH.

#choco install vscode --params "/NoDesktopIcon" -y
choco install vscode  -y
    
