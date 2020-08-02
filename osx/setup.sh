#!/bin/sh


echo Make sym links
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"


echo Install Homebrew
which brew > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "already installed brew"
else
  echo "install brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi


echo Install Vim
which vim > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "already installed vim"
else
  echo "install vim"
  yes | brew install vim
fi


echo Install tmux
brew install tmux
