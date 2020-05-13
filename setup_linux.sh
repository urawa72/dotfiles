#!/bin/bash

echo Make sym links
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
ln -fs "$SCRIPT_DIR/bash/bashrc" "$HOME/.bashrc"
ln -fs "$SCRIPT_DIR/bash/bash_profile" "$HOME/.bash_profile"
ln -fs "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"

echo Install dependencies
apt-get update
apt-get install -y libxmu-dev

echo Build Vim
git clone https://github.com/vim/vim
cd vim
./configure \
  --with-x \
  --enable-fail-if-missing \
  --with-features=huge \
  --disable-selinux \
  --enable-cscope \
  --enable-fontset \
  --enable-multibyte
make && sudo make install
