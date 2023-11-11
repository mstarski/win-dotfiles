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

