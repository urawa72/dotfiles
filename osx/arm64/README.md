# Setup steps for Apple Silicon Mac

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
pip install pynvim
```

## other tools

```zsh
# clang
brew install llvm

# made by rust tools
cargo install exa
cargo install ripgrep
cargo install --locked bat

# snippet manager
brew install knqyf263/pet/pet

# repository manager
go get github.com/x-motemen/ghq
goenv rehash
```
