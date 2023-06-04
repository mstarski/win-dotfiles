# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
	git
	zsh-autosuggestions
    docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
alias v="/usr/local/bin/nvim.appimage"
alias cfg="vim ~/.zshrc"
alias bat="batcat"
alias vim="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Util functions
function my_fzf() {
	cd $(find -L ~ \( -path '*/\.*' -o -path '/**/node_modules' -o -fstype 'dev' -o -fstype 'proc' \) -prune -o -type d -print 2> /dev/null | sed 1d | cut -b1- | fzf --preview 'bat --style=numbers --color=always {} | head -500' +m)
}

function ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    _ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}

function _ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        ranger "$@"
    else
        exit
    fi
}

# Keybinds
bindkey -s '^O' 'ranger-cd\n'
bindkey -s '^P' 'my_fzf\n'

# pnpm
export PNPM_HOME="/home/michals/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Created by `pipx` on 2023-05-10 06:48:40
export PATH="$PATH:/home/michals/.local/bin"

# Init plugins
eval "$(zoxide init zsh)"
