#!/bin/bash

USER=$(logname)
HOME=/home/$USER
PIPX_HOME=$HOME/.local/share/pipx

pipx_is_installed() {
  return $(pipx list | grep -q $1)
}

if [ "$EUID" -ne 0 ]; then
  echo "Please run with sudo -E"
  exit 1
fi

if ! command -v curl &> /dev/null; then
  dnf install curl -y
fi

if ! command -v g++ &> /dev/null; then
  dnf install gcc-c++ -y
fi

if ! command -v gcc &> /dev/null; then
	dnf install gcc -y
fi

if ! $(dnf list --installed | grep -q "dnf-plugins-core"); then
  dnf install dnf-plugins-core -y
fi

if ! $(dnf list --installed | grep -q "sxhkd"); then
  dnf install sxhkd -y
fi

if ! command -v cargo &> /dev/null; then
	dnf install cargo -y
fi

if ! command -v go &> /dev/null; then
	dnf install golang -y && \
	mkdir -p $HOME/go && \
	export GOPATH=$HOME/go
fi

if [[ ! $(go env GOPATH) == $HOME/go ]]; then
	echo "Error: \$GOPATH not set properly. Exitting..."
	exit 1
fi

if [[ ! -f /bin/zsh ]]; then
	dnf install zsh -y
fi

if [[ ! -f /bin/tmux ]]; then
	dnf install tmux -y
fi

if [[ ! -f /bin/bat ]]; then
	dnf install bat -y
fi

if [[ ! -d $HOME/.fzf ]]; then
	git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf && \
	$HOME/.fzf/install
fi

if ! command -v pipx &> /dev/null; then
	dnf install pipx -y && \
	pipx ensurepath
fi

if ! pipx_is_installed ranger; then
  pipx install ranger-fm
fi

if [[ ! -d /home/michals/.nvm ]]; then
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \

	export NVM_DIR="$HOME/.nvm" && \
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm && \
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion && \

	nvm install --lts && \
  nvm install 20.9.0 && \
	npm i -g pnpm
fi

if ! pipx_is_installed trash-cli; then
	dnf install python3-devel -y && \
  pipx install trash-cli
fi

if [[ ! -f $HOME/.cargo/bin/exa ]]; then
	cargo install exa
fi

if [[ ! -f $HOME/.cargo/bin/zoxide ]]; then
	cargo install zoxide --locked
fi

if ! command -v ag &> /dev/null; then
	dnf install the_silver_searcher -y
fi

if [[ ! -f $HOME/go/bin/sesh ]]; then
	go install github.com/joshmedeski/sesh@latest
fi

if [[ ! -f $HOME/go/bin/gum ]]; then
	go install github.com/charmbracelet/gum@latest
fi

if [[ ! -d $HOME/.oh-my-zsh ]]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [[ ! -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  dnf install zsh-syntax-highlighting -y
fi

ZSH_AUTOSUGGESTIONS_PATH=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

if [[ ! -d $ZSH_AUTOSUGGESTIONS_PATH ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS_PATH
fi

ZSH_PURE_PATH=$HOME/.zsh/pure

if [[ ! -d $ZSH_PURE_PATH ]]; then
  mkdir -p "$HOME/.zsh"
  git clone https://github.com/sindresorhus/pure.git $ZSH_PURE_PATH
fi

if [[ ! -f /usr/local/bin/cloudflared ]]; then
  dnf config-manager --add-repo https://pkg.cloudflare.com/cloudflared-ascii.repo
  dnf install cloudflared -y
fi

if pipx_is_installed tldr; then
  pipx install tldr
fi
