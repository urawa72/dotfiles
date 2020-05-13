#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
mkdir -p ~/.vim/colors

# シンボリックリンク作成
ln -fs "$SCRIPT_DIR/bash/bashrc" "$HOME/.bashrc"
ln -fs "$SCRIPT_DIR/bash/bash_profile" "$HOME/.bash_profile"
ln -fs "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"

# dependencies
apt-get update
apt-get install -y curl git
apt-get install -y make cmake autogen automake libffi-dev libperl-dev libbz2-dev zlib1g-dev libreadline-dev libssl-dev libsqlite3-dev bzip2

# vim color hybrid
git clone https://github.com/w0ng/vim-hybrid ~/vim-hybrid
mv ~/vim-hybrid/colors/hybrid.vim ~/.vim/colors

# vim8
### pyenv
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
pyenv -v
pyenv install --list | grep 3.7
CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.5
pyenv global 3.7.5
python --version

### rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
rbenv -v
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv install -l | grep 2.6
CONFIGURE_OPTS="--enable-shared" rbenv install 2.6.5
rbenv global 2.6.5
source ~/.bashrc
ruby -v

### lua
git clone https://github.com/cehoffman/luaenv.git ~/.luaenv
echo 'export PATH="$HOME/.luaenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(luaenv init -)"' >> ~/.bashrc
source ~/.bashrc
type luaenv
#=> "luaenv is a function(luaenv は関数です)"が出たらOK
git clone git://github.com/cehoffman/lua-build.git ~/.luaenv/plugins/lua-build # これやらないとinstallとかのコマンドが使えない
luaenv install --list # 一覧表示
CONFIGURE_OPTS="--enable-shared" luaenv install 5.3.5
luaenv global 5.3.5
lua -v
# Lua 5.3.5  Copyright (C) 1994-2018 Lua.org, PUC-Rio
which lua
# /home/ユーザ名/.luaenv/shims/lua

### build vim
cd /tmp
git clone https://github.com/vim/vim
cd vim
./configure \
  --enable-fail-if-missing \
  --with-features=huge \
  --disable-selinux \
  --enable-perlinterp \
  --enable-python3interp \
  --enable-rubyinterp \
  --with-ruby-command=$HOME/.rbenv/shims/ruby \
  --enable-luainterp \
  --with-lua-prefix=$HOME/.luaenv/versions/5.3.5 \
  --enable-cscope \
  --enable-fontset \
  --enable-multibyte \
  vi_cv_path_python3=$HOME/.pyenv/shims/python
make
# ↓↓↓make installする前に、lua, python, rubyが'+'になっているかを確認すること↓↓↓
# ./src/vim --version
# ↑↑↑make installする前に、lua, python, rubyが'+'になっているかを確認すること↑↑↑
make install

pip3 install neovim
