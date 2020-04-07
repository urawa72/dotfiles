#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)

# シンボリックリンク作成
ln -fs "$SCRIPT_DIR/zshrc" "$HOME/.zshrc"
ln -fs "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"
ln -fs "$SCRIPT_DIR/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$SCRIPT_DIR/tmux" "$HOME/"

# Homebrインストール
which brew > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "already installed brew"
else
  echo "install brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# vim
which vim > /dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "already installed vim"
else
  echo "install vim"
  yes | brew install vim
fi

# hybrid
git clone https://github.com/w0ng/vim-hybrid
mv vim-hybrid/colors/hybrid.vim ~/.vim/colors

# tmux
brew install tmux
