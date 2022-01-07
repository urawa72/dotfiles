# Setup steps for Apple Silicon Mac

## key settings

```zsh
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
```

## symbolic links

```zsh
# shell
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

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
pyenv global 3.9.7
exec $SHELL -l

anyenv install nodenv
nodenv install 16.13.1
nodenv global 16.13.1
exec $SHELL -l

anyenv install rbenv
rbenv install 2.7.5
rbenv global 2.7.5
exec $SHELL -l

anyenv install goenv
goenv install 1.16.0
goenv global 1.16.0
exec $SHELL -l
```

## nerdfont

```zsh
brew tap homebrew/cask-fonts
brew install --cask font-mononoki-nerd-font
```

## NeoVim

```zsh
brew install neovim
pip3 install pynvim
pip3 install neovim-remote
gem install neovim
npm i -g neovim
```

## Tmux

```zsh
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## other tools

```zsh
brew install ghq
brew install exa
brew install fzf
brew install ripgrep
brew install zsh
brew install llvm
brew install bat
```
