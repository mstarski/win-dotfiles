# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Pure: https://github.com/sindresorhus/pure#oh-my-zsh
# (manual install)
if [ -d $HOME/.zsh/pure ]; then
  fpath+=($HOME/.zsh/pure)

  autoload -U promptinit; promptinit
  prompt pure
fi

PURE_NODE_ENABLED=0
PURE_GIT_PULL=0
# PURE_PROMPT_SYMBOL="λ"
PURE_PROMPT_SYMBOL="🚀"
ZSH_THEME_AWS_REGION_PREFIX="🌍 "
ZSH_THEME_AWS_REGION_SUFFIX=""

plugins=(
	git
	zsh-autosuggestions
  aws
)

