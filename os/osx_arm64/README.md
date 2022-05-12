# Setup steps for Apple Silicon Mac

## key settings

```zsh
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
```

## symbolic links

```zsh
# shell
ln -fs "$HOME/dotfiles/zsh" "$HOME/.zsh.d"
ln -fs "$HOME/dotfiles/osx/arm64/zshrc" "$HOME/.zshrc"

# tmux
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/tmux/iceberg.tmux.conf" "$HOME/.tmux/iceberg.tmux.conf"

# vim
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"

# neovim
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.config/nvim/init.vim"

# alacritty
mkdir -p ~/.config/alacritty
ln -fs "$HOME/dotfiles/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

# coc.nvim
ln -fs "$HOME/dotfiles/configs/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/configs/vim/coc/coc-settings.json" "$HOME/.config/coc/coc-settings.json"
ln -fs "$HOME/dotfiles/configs/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"

# ghq, git
ln -fs "$HOME/dotfiles/configs/gitconfig" "$HOME/.gitconfig"

# pet
ln -fs "$HOME/dotfiles/configs/pet/config.toml" "$HOME/.config/pet/config.toml"

# rbm
ln -fs "$HOME/dotfiles/configs/rbm/rbm-bookmarks.toml" "$HOME/rbm-bookmarks.toml"
```

## Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
```

## anyenv

```zsh
brew install anyenv
exec $SHELL -l
anyenv install init
```

## pyenv, nodenv, goenv

```zsh
anyenv install pyenv
pyenv install 3.9.7
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
exec $SHELL -l

anyenv install nodenv
nodenv install 14.17.6
exec $SHELL -l

anyenv install goenv
goenv install 1.16.0
exec $SHELL -l
```

## nerdfont

```zsh
brew tap homebrew/cask-fonts
brew install --cask font-mononoki-nerd-font
```

## NeoVim

```zsh
brew install --HEAD neovim
pip3 install pynvim
pip3 install remote-neovim
```

## Tmux

```zsh
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## other tools

```zsh
# clang
brew install llvm

# made by rust tools
cargo install exa
cargo install ripgrep
cargo install --locked bat
cargo install fd-find

# snippet manager
brew install knqyf263/pet/pet

# repository manager
go get github.com/x-motemen/ghq
goenv rehash
```
