# Aliases
alias v="/usr/local/bin/nvim.appimage"
alias vim="nvim"
alias cfg="vim ~/.zshrc"

if command -v "batcat" > /dev/null; then
  alias cat="batcat"
  alias bat="batcat"
else
  alias cat="bat"
fi

alias lcat="/usr/bin/cat"
alias ls="exa --icons -F"
alias tf="terraform"
alias gco="g co \$(git branch | fzf-tmux -d 15)"
alias k="kubectl"
alias g="git"
alias la="ls -la"
alias t="sesh connect"
alias lg="lazygit"
alias d="dotnet"
