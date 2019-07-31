#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# シンボリックリンク作成
ln -fs "$SCRIPT_DIR/.bashrc" "$HOME/.bashrc"
ln -fs "$SCRIPT_DIR/.bash_profile" "$HOME/.bash_profile"
ln -fs "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"

# Homebrインストール
which brew > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "already installed brew"
else
  echo "install brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# git
which git > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "already installed git"
else
  echo "install git"
  yes | brew install git
fi

# vim
which vim > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "already installed vim"
else
  echo "install vim"
  yes | brew install vim
fi

# vim-plug
# https://github.com/junegunn/vim-plug

