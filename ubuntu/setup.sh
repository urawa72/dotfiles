#!/bin/sh


echo "########## Make sym links ##########"
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"


echo "########## Install dependencies ##########"
apt install -y curl git fzf


echo "########## Install zsh ##########"
apt install -y zsh powerline fonts-powerline
chsh -s $(which zsh)
# exec $SHELL -l


echo "########## Install neovim ##########"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
apt install -y neovim
apt install -y \
  build-essential \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  liblzma-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev

# python
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.zshrc
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
pyenv install 3.8.5
pyenv install 2.7.18
pyenv virtualenv 3.8.5 neovim3
pyenv virtualenv 2.7.18 neovim2
pyenv shell neovim3
pip install pynvim
pyenv shell neovim2
pip install pynvim

# ruby
apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
~/.rbenv/bin/rbenv init
source ~/.zshrc
rbenv install 2.6.3
rbenv global 2.6.3
gem install neovim

# node
apt install -y nodejs npm
npm i -g n
n stable
apt purge -y nodejs npm
# exec $SHELL -l
npm i -g neovim

# not install when docker
# echo Install tmux
# apt install -y automake bison build-essential pkg-config libevent-dev libncurses5-dev
# git clone https://github.com/tmux/tmux /usr/local/src/tmux
# cd /usr/local/src/tmux
# ./autogen.sh
# ./configure --prefix=/usr/local
# make & make install
# git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
