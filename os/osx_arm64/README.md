# Setup steps for Apple Silicon Mac

## key settings

```zsh
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
```

## symbolic links

```zsh
# shell
ln -fs "$HOME/dotfiles/config/zsh/" "$HOME/.config/zsh"
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

# wezterm
ln -fs "$HOME/dotfiles/config/wezterm/" "$HOME/.config/wezterm"

# tmux
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/tmux/iceberg.tmux.conf" "$HOME/.tmux/iceberg.tmux.conf"

# neovim
ln -fs "$HOME/dotfiles/os/osx_arm64/vimrc" "$HOME/.config/nvim/init.vim"

# ultisnips
ln -fs "$HOME/dotfiles/config/ultisnips/" "$HOME/.config/ultisnips"

# coc.nvim
ln -fs "$HOME/dotfiles/config/coc/ "$HOME/.config/coc

# ghq, git
ln -fs "$HOME/dotfiles/gitconfig" "$HOME/.gitconfig"

# pet
ln -fs "$HOME/dotfiles/config/pet/" "$HOME/.config/pet"

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
pip3 instal neovim-remote
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
