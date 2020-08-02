#!/bin/sh


echo Make sym links
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
# 下記はVimとWindowsのClipboard共有に使用
ln -fs "$HOME/dotfiles/.zprofile" "$HOME/.zprofile"
ln -fs "$HOME/dotfiles/.env" "$HOME/.env"


echo Install zsh
apt install -y zsh powerline fonts-powerline


echo Install zsh and oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source $ZSH/oh-my-zsh.sh


echo Install tmux
apt install -y automake bison build-essential pkg-config libevent-dev libncurses5-dev
git clone https://github.com/tmux/tmux /usr/local/src/tmux
cd /usr/local/src/tmux
./autogen.sh
./configure --prefix=/usr/local
make & make install
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack


echo Build Vim
apt install -y \
  git \
  gettext \
  libtinfo-dev \
  libacl1-dev \
  libgpm-dev \
  build-essential \
  libperl-dev \
  python-dev \
  python3-dev \
  ruby-dev \
  lua5.2 \
  liblua5.2-dev \
  autoconf \
  automake \
  cproto
cd /tmp
git clone https://github.com/vim/vim.git
cd vim
./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-cscope \
  --enable-fontset \
  --enable-fail-if-missing \
  --enable-pythoninterp=dynamic \
  --enable-python3interp=dynamic \
  --enable-rubyinterp=dynamic \
make && make install
rm -rf /tmp/vim


# LSP clangd これで解決
# https://github.com/mattn/vim-lsp-settings/issues/69
