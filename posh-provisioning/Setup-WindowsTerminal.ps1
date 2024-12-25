#<#
#.Synopsis
#	Install Windows Terminal and create a shortcut on the desktop
#.Description
#	Install Windows Terminal and create a shortcut on the desktop
##>


Write-Host "Install Windows Terminal and create a shortcut on the desktop"

choco install gsudo -y
choco install microsoft-windows-terminal -y

$LocalAppFolder = "$Home\AppData\Local\Marvin"

$urlTerminalIcon = "https://raw.githubusercontent.com/microsoft/terminal/refs/heads/main/res/terminal.ico"
$TerminalIconFilePath = "$LocalAppFolder\terminal.ico"

if (-not (Test-Path ($LocalAppFolder)))
{
    New-Item -Path $LocalAppFolder  -ItemType "Directory"
}

Invoke-WebRequest -Uri $urlTerminalIcon -OutFile $TerminalIconFilePath

# Search for the wt.exe file in the installation folder
$wt = Get-ChildItem -Path "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_*_x64__8wekyb3d8bbwe" -Filter "wt.exe" -Recurse

if($?)
{
    $SourceFilePath = $wt.FullName
    $ShortcutPath = "$Home\Desktop\Windows Terminal.lnk"
    $WScriptObj = New-Object -ComObject ("WScript.Shell")
    $shortcut = $WscriptObj.CreateShortcut($ShortcutPath)
    $shortcut.TargetPath = $SourceFilePath
    $shortcut.IconLocation = $TerminalIconFilePath
    $shortcut.Save()
    
}



# # Pin shortcuts to the taskbar
# $shell = New-Object -ComObject Shell.Application
# $taskbarPath = [System.IO.Path]::Combine([Environment]::GetFolderPath('ApplicationData'), 'Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar')

# $shell.Namespace($taskbarPath).Self.InvokeVerb('pindirectory', $ShortcutPath)

    # # Create a shortcut
    # mklink /D "C:\\Users\\$env:USERNAME\\Desktop\\WinTerminalShortcut.lnk" """C:\\Program Files\\WindowsApps\\Microsoft.WindowsTerminalPreview_1.22.3232.0_x64__8wekyb3d8bbwe\\WindowsTerminal.exe"""

    # # Pin the shortcut to the taskbar
    # $shell = New-Object -ComObject Shell.Application
    # $folder = $shell.Namespace('shell:::{374DE290-123F-4565-9164-39C4925E467B}')
    # $shortcut = $folder.CreateItem()
    # $shortcut.Path = "C:\\Users\\$env:USERNAME\\Desktop\\WinTerminalShortcut.lnk"
    # $shortcut.InvokeVerb('pintotaskbar')
