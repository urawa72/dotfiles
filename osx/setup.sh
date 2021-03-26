#!/bin/sh


echo Install brew packages
brew install tmux
brew install neovim
brew install ghq
brew install exa
brew install fzf
brew install ripgrep
brew install zsh
brew install llvm
brew install anyenv


echo Install zsh plugins
mkdir ~/.zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
zplug install


echo Make sym links
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/tmux/iceberg.tmux.conf" "$HOME/.tmux/iceberg.tmux.conf"
ln -fs "$HOME/dotfiles/vimrc.vim" "$HOME/.config/nvim/init.vim"
ln -fs "$HOME/dotfiles/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"


echo "########## Install pyenv ##########"
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
