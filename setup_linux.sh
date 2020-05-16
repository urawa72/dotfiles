#!/bin/sh

echo Make sym links
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
ln -fs "$SCRIPT_DIR/bash/bashrc" "$HOME/.bashrc"
ln -fs "$SCRIPT_DIR/bash/bash_profile" "$HOME/.bash_profile"
ln -fs "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"

echo Install dependencies
apt update
apt install -y \
  build-essential \
  vim-python \
  python-dev \
  python3-dev \
  ruby-dev \
  lua5.2 \
  liblua5.2-dev \
  luajit \
  libluajit-5.1 \
  libxmu-dev \
  libgtk2.0-dev \
  libxpm-dev \
  ncurses-dev \
  autoconf \
  automake \
  cproto

echo Build Vim
cd /tmp
git clone https://github.com/vim/vim
cd vim
./configure \
  --with-features=huge \
  --with-x \
  --enable-multibyte \
  --enable-cscope \
  --enable-fontset \
  --enable-fail-if-missing \
  --enable-pythoninterp=dynamic \
  --enable-python3interp=dynamic \
  --enable-rubyinterp=dynamic \
make && make install
