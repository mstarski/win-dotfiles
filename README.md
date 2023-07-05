# My personal config for WSL workflow

![thumb-1920-116875](https://github.com/mstarski/win-dotfiles/assets/32843198/a151d914-7e31-41f4-9dda-5d08628e3c2e)

## Requirements

### Linux

All dependencies are listed in `deps.json` under `dependencies` key.
There is a healthcheck script included that will check if everything is set up correctly.
It can be run via

```
./healthcheck.py
```

Of course `python3` is needed to run this one.

### Windows

- WSL
- Administrator access to powershell

## How to use?

### Installation

```bash
git clone git@github.com:mstarski/win-dotfiles.git ~/.config/win-dotfiles
```

### Assets

Make sure that every asset in `assets` directory is properly installed in the system (i.e font).

### Symlinks

Symlinks will make sure that every file from this repo will be linked to the proper location.
Files that will be symlinked:

- `nvim` directory for neovim
- `tmux.conf` for tmux configuration
- `zshrc` for zshell configuration
- `AutoHotkey.ahk` for AutoHotkey configration
- `win-term-settings.json` for Windows Terminal configuration

There are scripts provided that will do everything automatically on both systems:

```bash
./linux-symlinks.sh
```

```powershell
./win-symlinks.ps1 # Make sure to run this one as an Administrator
```

### Git aliases

A set of useful git aliases that can be injected like this:

```bash
git config --global include.path $(pwd)/gitalias.txt
```

### Secrets

If there are any secrets that have to be injected to the environment but can't be stored publicly
there are 2 ways to store them in this repo:

1. Create a `secrets.zsh` file in `shell` directory and write your variables there. It's .gitignored
   so it won't be commited to the repo.

2. Use `get-secrets.py` script that will download values from the Bitwarden CLI. These secrets must be already stored
   encrypted to avoid pasting them in plaintext. Script will read `secrets` array from the `deps.json`, query BW for values and then
   put it in the `~/.secrets` directory where they can be read.

### Third party stuff

All the third-party stuff should be placed under .gitignored folder `third-party` to not pollute the repo
