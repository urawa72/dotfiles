#!/bin/sh


echo Install startship
curl -fsSL https://starship.rs/install.sh | bash


echo Install brew packages
brew install tmux
brew install neovim
brew install lazygit
brew install ghq
brew install exa
brew install fzf
brew install ripgrep


echo Install tmux-themepack
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo Make sym links
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/starship.toml" "$HOME/.config/starship.toml"
ln -fs "$HOME/dotfiles/vscode/settings.json" "$HOME/Library/ApplicationSupport/Code/User/settings.json"
ln -fs "$HOME/dotfiles/vscode/keybindings.json" "$HOME/Library/ApplicationSupport/Code/User/keybindings.json"


echo Install pyenv
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


echo Install rbenv
gem install neovim


echo Install n
npm i -g neovim
