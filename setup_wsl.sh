#!/bin/sh

echo Make sym links
SCRIPT_DIR=$(cd $(dirname $0) && pwd)
ln -fs "$SCRIPT_DIR/zshrc" "$HOME/.zshrc"
ln -fs "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"
ln -fs "$SCRIPT_DIR/tmux.conf" "$HOME/.tmux.conf"

# echo Install zsh and oh-my-zsh
# sudo apt install -y zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# source $ZSH/oh-my-zsh.sh

echo Install tmux
echo Install Powerline fonts

# LSP clangd これで解決
# https://github.com/mattn/vim-lsp-settings/issues/69
