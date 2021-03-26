#!/bin/sh


echo "########## Make sym links ##########"
git clone https://github.com/urawa72/dotfiles ~/dotfiles
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.config/nvim/init.vim"
ln -fs "$HOME/dotfiles/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"


echo "########## Install zsh, zplug, pure ##########"
# zsh
apt install -y zsh
chsh -s $(which zsh)
# zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
zplug install
# pure
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"


echo "########## Install neovim ##########"
apt install -y neovim \
  build-essential \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  liblzma-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev


echo "########## Install anyenv ##########"
# anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile
~/.anyenv/bin/anyenv init
yes | anyenv install --init


echo "########## Install pyenv ##########"
# see https://github.com/pyenv/pyenv/wiki
apt-get install -y --no-install-recommends \
  make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  wget \
  curl \
  llvm \
  libncurses5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev
anyenv install pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
pyenv install 3.8.5
pyenv install 2.7.18
pyenv virtualenv 3.8.5 neovim3
pyenv virtualenv 2.7.18 neovim2
pyenv shell neovim3
pip install pynvim
pyenv shell neovim2
pip install pynvim


echo "########## Install rbenv ##########"
anyenv install rbenv
rbenv install 2.7.1
rbenv global 2.7.1
gem install neovim


echo "########## Install nodenv ##########"
anyenv install nodenv
nodenv install 14.16.0
nodenv global 14.16.0
npm i -g neovim


# echo "########## Install tmux ##########"
# apt install -y automake bison build-essential pkg-config libevent-dev libncurses5-dev
# git clone https://github.com/tmux/tmux /usr/local/src/tmux
# cd /usr/local/src/tmux
# ./autogen.sh
# ./configure --prefix=/usr/local
# make & make install
# git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
