#!/bin/sh


echo Make sym links
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
mkdir -p ~/.config
ln -fs "$HOME/dotfiles/starship.toml" "$HOME/.config/starship.toml"


echo Install zsh
apt install -y zsh powerline fonts-powerline


echo install startship
curl -fsSL https://starship.rs/install.sh | bash


echo Install tmux
# Dockerの場合はインストール済
# apt install -y automake bison build-essential pkg-config libevent-dev libncurses5-dev
git clone https://github.com/tmux/tmux /usr/local/src/tmux
cd /usr/local/src/tmux
./autogen.sh
./configure --prefix=/usr/local
make & make install
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo Build Vim
# Dockerの場合はインストール済
# apt install -y \
#   git \
#   gettext \
#   libtinfo-dev \
#   libacl1-dev \
#   libgpm-dev \
#   build-essential \
#   libperl-dev \
#   python-dev \
#   python3-dev \
#   ruby-dev \
#   lua5.2 \
#   liblua5.2-dev \
#   autoconf \
#   automake \
#   cproto
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
  --enable-gui=auto \
  --enable-gtk2-check \
  --with-x
make && make install
