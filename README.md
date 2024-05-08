# My personal config for WSL workflow

![thumb-1920-116875](https://github.com/mstarski/win-dotfiles/assets/32843198/a151d914-7e31-41f4-9dda-5d08628e3c2e)

## Requirements

### Linux

Install zsh first. Follow your distribution's instructions and make sure it exists on your system.

```bash
# fedora example
sudo dnf install zsh
```

All dependencies are listed in `deps.json` under `dependencies` key.
There is a healthcheck script included that will check if everything is set up correctly.
It's written in python so we have to init virtual environment first.

```
python3 -m venv .venv
.venv/bin/pip3 install -r requirements.txt
```

After that run:

```
./healthcheck.py
```

to see what's missing on your system. Install necessary dependencies before proceeding further.

### Windows

- WSL
- Administrator access to powershell

## How to use?

## Debloat first

```powershell
irm christitus.com/win | iex
```

### Installation

```bash
git clone git@github.com:mstarski/win-dotfiles.git ~/.config/win-dotfiles
```

### Assets

Make sure that every asset in `assets` directory is properly installed in the system (i.e font).

### Neovim config

Copy default env.example.lua to env.lua file to start with the default configuration

```bash
cp nvim/lua/mstarski/env.example.lua nvim/lua/mstarski/env.lua
```

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

### Tmux
1. Install [tmux plugin manager](https://github.com/tmux-plugins/tpm)
2. Install plugins via `<prefix>I`

### Shell "distros"
1. `oh-my-zsh`
If you use [oh my zsh](https://ohmyz.sh/) as your distro set `MS_OH_MY_ZSH` environment variable to `1`.
After that install [pure theme](https://github.com/sindresorhus/pure#oh-my-zsh)

2. `oh-my-posh`
If you use [oh my posh](https://ohmyposh.dev/) as your distro set `MS_OH_MY_POSH` environment variable to `1`.

After installing shell distro make sure to install [zsh-autosuggestions plugin](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

### Secrets

If there are any secrets that have to be injected to the environment but can't be stored publicly
there are 2 ways to use them in this repo:

1. Create a `secrets.zsh` file in the `shell` directory and write your variables there. It's .gitignored and sourced automatically
   so it will work out of the box without commiting to the repo.

2. Use `get-secrets.py` script that will download values from the Bitwarden CLI. These secrets must be already stored
   encrypted to avoid pasting them in plaintext. Script will read `secrets` array from the `deps.json`, query BW for values and then
   put it in the `~/.secrets` directory where they can be read.

### Third party stuff

All the third-party stuff should be placed under .gitignored folder `third-party` to not pollute the repo
