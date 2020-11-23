#!/bin/sh

echo Install vim, tmux
sudo port install vim tmux tmux-pasteboard


echo Install tmux dependencies
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo Make symbolic link
ln -fs "$HOME/dotfiles/osx/arm64/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/osx/arm64/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/osx/arm64/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"


echo Install nodejs with nvm
# set NVM_DIR to zshrc
# can not install 12, 14
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
nvm i v15.2.1


echo Install go
# set GOPATH and GOROOT to zshrc
# can not install arm64
curl -OL https://golang.org/dl/go1.15.5.darwin-amd64.tar.gz
tar xvzf go1.15.5.darwin-amd64.tar.gz
sudo mv go /usr/local/
