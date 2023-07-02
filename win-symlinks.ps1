$wsl_uname = wsl.exe -u
$wsl_distroname = wsl.exe --list --running --quiet
$wsl_home = "\\wsl.localhost\$wsl_distroname\home\$wsl_uname"

$localappdata = [Environment]::GetFolderPath("LocalApplicationData")
$desktop_path = [Environment]::GetFolderPath("Desktop")

$terminal_settings_path = "$localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

$terminal_settings_symlink = "$terminal_settings_path\settings.json"
$autohotkey_script_symlink = "$desktop_path\Scripts\AutoHotkey.ahk"

# Check if file doesn't exists
if (!(Test-Path $terminal_settings_symlink)) {
    New-Item -ItemType SymbolicLink -Path $terminal_settings_symlink -Target "$wsl_home\.config\win-dotfiles\win-term-settings.json"
    Write-Host "Symlink created for Windows Terminal settings"
} else {
    Write-Host "Symlink for Windows Terminal settings already exists"
}

if (!(Test-Path $autohotkey_script_symlink)) {
    New-Item -ItemType SymbolicLink -Path $autohotkey_script_symlink -Target "$wsl_home\.config\win-dotfiles\AutoHotkey.ahk"
    Write-Host "Symlink created for AutoHotkey script"
} else {
    Write-Host "Symlink for AutoHotkey script already exists"
}

# Wait for user input to close
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
```
