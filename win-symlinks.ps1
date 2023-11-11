# Run this as an administrator

param(
    [Parameter()]
    [String]$distro
)

if(!$distro) {
    Write-Host "WSL distribution not provided. Please specify -distro option"
    return;
}

$wsl_distroname = (wsl --list --running --quiet) -replace "\x00","" | Where-Object { $_ -like "*$distro*" }
$wsl_uname = wsl.exe -e whoami

if(!$wsl_distroname) {
    Write-Host "Distribution $distro not found";
    return;
}

$wsl_home = "\\wsl.localhost\$wsl_distroname\home\$wsl_uname"

$localappdata = [Environment]::GetFolderPath("LocalApplicationData")
$appdata = [Environment]::GetFolderPath("ApplicationData")
$desktop_path = [Environment]::GetFolderPath("Desktop")
$windows_home = [Environment]::GetFolderPath("USERPROFILE")

$win_config_path = "$appdata\mstarski.win-dotfiles"
$terminal_settings_path = "$localappdata\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

$terminal_settings_symlink = "$terminal_settings_path\settings.json"
$autohotkey_script_symlink = "$desktop_path\Scripts\AutoHotkey.ahk"
$terminal_bg_img_dest = "$win_config_path\terminal-bg"
$glaze_wm_config_path = "$windows_home\.glaze-wm" 


try {
  # Create %LOCALAPPDATA%\mstarski.win-dotfiles directory if doesn't exist
  if (!(Test-Path $win_config_path)) {
      New-Item -ItemType Directory -Path $win_config_path
      Write-Host "Data directory created for win-dotfiles"
  } else {
      Write-Host "Data directory for win-dotfiles already exists"
  }

  # Create Scripts directory on Desktop if doesn't exist
  if (!(Test-Path "$desktop_path\Scripts")) {
      New-Item -ItemType Directory -Path "$desktop_path\Scripts"
      Write-Host "Scripts directory created on Desktop"
  } else {
      Write-Host "Scripts directory on Desktop already exists"
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

  if (!(Test-Path $glaze_wm_config_path)) {
      New-Item -ItemType SymbolicLink -Path $glaze_wm_config_path -Target "$wsl_home\.config\win-dotfiles\glaze-wm"
      Write-Host "Symlink created for glaze-wm config"
  } else {
      Write-Host "Symlink for glaze-wm config already exists"
  }
} catch {
  Write-Host "An error occurred:"
  Write-Host $_
} finally {
  # Wait for user input to close
  Write-Host "Press any key to continue..."
  $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}


