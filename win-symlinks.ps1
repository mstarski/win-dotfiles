# Run this as an administrator

$wsl_distroname = (wsl --list --running --quiet) -replace "\x00","" | Where-Object { $_ -like '*Ubuntu*' }
$wsl_uname = wsl.exe -e whoami

$wsl_home = "\\wsl.localhost\$wsl_distroname\home\$wsl_uname"

$localappdata = [Environment]::GetFolderPath("LocalApplicationData")
$desktop_path = [Environment]::GetFolderPath("Desktop")

$terminal_settings_path = "$localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

$terminal_settings_symlink = "$terminal_settings_path\settings.json"
$autohotkey_script_symlink = "$desktop_path\Scripts\AutoHotkey.ahk"
$terminal_bg_img_dest = "$localappdata\mstarski.win-dotfiles\terminal-bg"

# Create %LOCALAPPDATA%\mstarski.win-dotfiles directory if doesn't exist
if (!(Test-Path "$localappdata\mstarski.win-dotfiles")) {
    New-Item -ItemType Directory -Path "$localappdata\mstarski.win-dotfiles"
    Write-Host "Directory created for win-dotfiles"
} else {
    Write-Host "Directory for win-dotfiles already exists"
}

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

if(!(Test-Path $terminal_bg_img_dest)) {
    # Copy background image to %LOCALAPPDATA%\mstarski.win-dotfiles
    Copy-Item -Path "$wsl_home\.config\win-dotfiles\assets\terminal-bg" -Destination $terminal_bg_img_dest
    Write-Host "Background image copied to $terminal_bg_img_dest"
} else {
    # Replace background image in %LOCALAPPDATA%\mstarski.win-dotfiles
    Write-Host "Background image already exists in $terminal_bg_img_dest, replacing..."
    Copy-Item -Path "$wsl_home\.config\win-dotfiles\assets\terminal-bg" -Destination $terminal_bg_img_dest -Force
}

# Wait for user input to close
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
