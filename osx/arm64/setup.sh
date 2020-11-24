#!/bin/sh

echo Make symbolic link
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/osx/arm64/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/osx/arm64/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/osx/arm64/vimrc" "$HOME/.config/nvim/init.vim"
ln -fs "$HOME/dotfiles/osx/arm64/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"


echo Install with MacPort
sudo port install vim
sudo port install tmux
sudo port install tmux-pasteboard
sudo port install go
sudo port install python38


echo Install homebrew
mkdir homebrew
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
sudo mv homebrew /opt
source ~/.zshrc


echo Install noevim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz
tar xzvf nvim-macos.tar.gz
rm nvim-macos.tar.gz
sudo mv nvim-osx64 /opt/local/bin
sudo ln -fs /opt/local/bin/nvim-osx64/bin/nvim /opt/local/bin/nvim

echo Install zplug
source ~/.zshrc
git clone https://github.com/zplug/zplug "$ZPLUG_HOME";


echo Install tmux dependencies
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo Install nodejs with nvm
# set NVM_DIR to zshrc
# can not install 12,14
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
nvm i v15.2.1


echo Install rust and packages
# default host triple: x86_64-apple-darwin
# default toolchain: nightly
# profile: default
# modify PATH variable: no
arch --x86_64 sh <(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs )
source ~/.zshrc
cargo install ripgrep
cargo install exa
cargo install bat


echo Install go and packages
# set GOPATH and GOROOT to zshrc
# can not install arm64
curl -OL https://golang.org/dl/go1.15.5.darwin-amd64.tar.gz
tar xvzf go1.15.5.darwin-amd64.tar.gz
sudo mv go /usr/local/
source ~/.zshrc
