# My personal config for WSL workflow

## Requirements

### Linux

- neovim
- `tmux
- `zsh`
- `bat`
- `fzf`

### Windows

- WSL
- Windows terminal theme: `zenwrittern_dark`

### How to use?

Symlink every file to a place where it should be used.
This way every change to any of the files will reflect to this repo and
making the process nice and easy.

#### Windows symlink command

```powershell
New-Item -ItemType SymbolicLink -Path "windows-path\to\symlink" -Target "\\wsl$\Ubuntu\home\yourusername\path\to\target-thing"
```

#### Linux symlink command

```bash
ln -s <path to the file/folder to be linked> <the path of the link to be created>
```
