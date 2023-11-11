#!/bin/bash

USER_HOME=/home/$(whoami)
DOTFILES=$USER_HOME/.config/win-dotfiles

# $1: source file
# $2: destination file
function create_symlink {
    if [ ! -e $1 ]; then
        echo "🔴 $1 file does not exist, skipping..."
        return
    fi

    if [ -L $2 ]; then
        echo "🟢 $2 symlink exists, skipping..."
    else
        if [ -f $2 ]; then
            echo "🟡 $2 file exists but it's not a symlink, replacing with symlink..."
            cp $2 $2.bak
            echo "🔵 $2 backup created at $2.bak"
            rm $2
        else
            echo "🔵 $2 symlink does not exist, creating..."
        fi

        ln -s $1 $2
    fi
}

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

create_symlink /usr/bin/batcat /usr/bin/bat
create_symlink $DOTFILES/shell/zshrc $USER_HOME/.zshrc
create_symlink $DOTFILES/tmux.conf $USER_HOME/.tmux.conf
create_symlink $DOTFILES/nvim $USER_HOME/.config/nvim
