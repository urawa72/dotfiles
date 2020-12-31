#!/bin/sh


echo Install brew packages
brew install tmux
brew install neovim
brew install lazygit
brew install ghq
brew install exa
brew install fzf
brew install ripgrep
brew install zsh
brew install zplug
brew install llvm


echo Install zsh plugins
source ~/.zshrc
zplug install
source ~/.zshrc


echo Make sym links
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/tmux/iceberg.tmux.conf" "$HOME/.tmux/iceberg.tmux.conf"
ln -fs "$HOME/dotfiles/vimrc.vim" "$HOME/.config/nvim/init.vim"
ln -fs "$HOME/dotfiles/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"


echo Install python neovim
brew install pyenv
brew install pyenv-virtualenv
source ~/.zshrc
pyenv install 3.8.5
pyenv install 2.7.18
pyenv virtualenv 3.8.5 neovim3
pyenv virtualenv 2.7.18 neovim2
pyenv shell neovim3
pip install pynvim
pyenv shell neovim2
pip install pynvim


echo Install ruby neovim
gem install neovim


echo Install nodejs neovim
npm i -g neovim
