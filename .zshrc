# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(
	docker
	git 
	zsh-autosuggestions
)

# Load omzsh
source $ZSH/oh-my-zsh.sh

# Load Rust environment
source "$HOME/.cargo/env"

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# User configuration

export ZELLIJ_AUTO_EXIT=true
export ZELLIJ_AUTO_ATTACH=true

# Example aliases
alias vim="nvim"
alias v="nvim"
alias cfg="nvim ~/.zshrc"
alias src="source ~/.zshrc"
alias k="kubectl"
alias vimcfg="nvim $HOME/.config/nvim/init.vim"
alias tm="tmux attach || tmux new"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Start ZelliJ
# eval "$(zellij setup --generate-auto-start zsh)"



