# dotfiles

## Setup for Mac

### key settings

```zsh
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
```

### symbolic links

```zsh
# shell
ln -fs "$HOME/dotfiles/config/zsh/" "$HOME/.config/zsh"
ln -fs "$HOME/dotfiles/config/zshrc" "$HOME/.zshrc"

# wezterm
ln -fs "$HOME/dotfiles/config/wezterm/" "$HOME/.config/wezterm"

# neovim
ln -fs "$HOME/dotfiles/config/lazy_nvim" "$HOME/.config/nvim"

# mise
ln -fs "$HOME/dotfiles/config/mise/" "$HOME/.config/mise"

# ultisnips
ln -fs "$HOME/dotfiles/config/ultisnips/" "$HOME/.config/ultisnips"

# ghq, git
ln -fs "$HOME/dotfiles/config/gitconfig" "$HOME/.gitconfig"

# pet
ln -fs "$HOME/dotfiles/config/pet/" "$HOME/.config/pet"
```

### mise

```sh
curl https://mise.run | sh
mise install
```

### neovim

```zsh
brew install neovim
pip3 install pynvim
pip3 install neovim-remote
```

### other tools

```zsh
# for nvim
brew install fzf

# for clang
brew install llvm

# rust tools
cargo install exa
cargo install ripgrep
cargo install --locked bat
cargo install fd-find

# snippet manager
brew install knqyf263/pet/pet

# repository manager
go install github.com/x-motemen/ghq@latest
goenv rehash
```
