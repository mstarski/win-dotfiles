# Aliases
alias v="nvim"
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
alias gco="g co \$(git branch | gum filter --header \"Git checkout branch\")"
alias k="kubectl"
alias g="git"
alias la="ls -la"
alias t="sesh connect"
alias lg="lazygit"
alias d="dotnet"
alias z="cd"
alias t="trash"
alias trashcd="cd ~/.local/share/Trash/files"
