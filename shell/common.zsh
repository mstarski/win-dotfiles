# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

PURE_NODE_ENABLED=0
PURE_PROMPT_SYMBOL="$"
ZSH_THEME="lambda-pure"
ZSH_THEME_AWS_REGION_PREFIX="🌍 "
ZSH_THEME_AWS_REGION_SUFFIX=""

plugins=(
	git
	zsh-autosuggestions
  docker
  aws
)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2023-05-10 06:48:40
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
