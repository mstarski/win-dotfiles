#!/bin/bash
REPO=https://github.com/marszall87/lambda-pure.git
THEME_NAME=lambda-pure
INSTALL_LOCATION=$HOME/.config/win-dotfiles/third-party/$THEME_NAME
DESTINATION=$HOME/.oh-my-zsh/custom/themes/lambda-pure.zsh-theme
ASYNC_FN_DESTINATION=/usr/local/share/zsh/site-functions/async

# Check if oh-my-zsh is installed
if [ ! -d $HOME/.oh-my-zsh ]; then
    echo "oh-my-zsh is not installed. Please install oh-my-zsh first."
    exit 1
fi

# Check if theme is already installed
if [ -d $INSTALL_LOCATION ]; then
    echo "Theme [$THEME_NAME] is already installed. ✅"
else
    echo "Installing theme [$THEME_NAME]..."
    git clone $REPO $INSTALL_LOCATION
fi

echo "Creating symlinks..."
if [ -L $DESTINATION ]; then
    echo "Removing old theme symlink. $DESTINATION"
    rm $DESTINATION
fi

if [ -L $ASYNC_FN_DESTINATION ]; then
    echo "Removing old async symlink. $ASYNC_FN_DESTINATION"
    rm $ASYNC_FN_DESTINATION
fi

ln -s $INSTALL_LOCATION/lambda-pure.zsh $DESTINATION && \
sudo ln -s $INSTALL_LOCATION/async.zsh $ASYNC_FN_DESTINATION && \


echo "Theme [$THEME_NAME] installed successfully. 🚀"
exit 0
