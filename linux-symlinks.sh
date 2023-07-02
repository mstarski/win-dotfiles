#!/bin/bash

DOTFILES=$HOME/.config/win-dotfiles

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

create_symlink $DOTFILES/shell/zshrc $HOME/.zshrc
create_symlink $DOTFILES/tmux.conf $HOME/.tmux.conf
create_symlink $DOTFILES/nvim $HOME/.config/nvim
