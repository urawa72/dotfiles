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

# neovim
ln -fs "$HOME/dotfiles/config/nvim" "$HOME/.config/nvim"

# ultisnips
ln -fs "$HOME/dotfiles/config/ultisnips/" "$HOME/.config/ultisnips"

# ghq, git
ln -fs "$HOME/dotfiles/config/gitconfig" "$HOME/.gitconfig"

# pet
ln -fs "$HOME/dotfiles/config/pet/" "$HOME/.config/pet"
```

## Homebrew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
```

## asdf

```zsh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

asdf plugin add python https://github.com/danhper/asdf-python.git
asdf install python 3.9.13
asdf global python 3.9.13

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 3.1.0
asdf global ruby 3.1.0

asdf plugin add golang https://github.com/kennyp/asdf-golang.git
asdf install golang latest
asdf global golang latest
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