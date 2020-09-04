#!/bin/sh


echo Install startship
yes | curl -fsSL https://starship.rs/install.sh | bash


echo Install vim
brew install vim


echo Install tmux
brew install tmux
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo Make sym links
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
mkdir -p ~/.config
ln -fs "$HOME/dotfiles/starship.toml" "$HOME/.config/starship.toml"
ln -fs "$HOME/dotfiles/vscode/settings.json" "$HOME/Library/ApplicationSupport/Code/User/settings.json"
ln -fs "$HOME/dotfiles/vscode/keybindings.json" "$HOME/Library/ApplicationSupport/Code/User/keybindings.json"
