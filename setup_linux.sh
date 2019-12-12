#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
mkdir ~/.vim

# シンボリックリンク作成
ln -fs "$SCRIPT_DIR/.bashrc" "$HOME/.bashrc"
ln -fs "$SCRIPT_DIR/.bash_profile" "$HOME/.bash_profile"
ln -fs "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
ln -fs "$SCRIPT_DIR/userautoload" "$HOME/.vim/"

# dependencies
apt-get update
apt-get install -y curl git vim

# hybrid
git clone https://github.com/w0ng/vim-hybrid
mv vim-hybrid/colors/hybrid.vim ~/.vim/colors
