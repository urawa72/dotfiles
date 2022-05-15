# Setup steps for Ubuntu 22.04

## Hardware Settings

### Basic

- install gnome-tweaks

```zsh
sudo apt install -y gnome-tweaks
```

- tweaks > Keyboard & Mouse > enable Emacs Input (can backspace with ctrl + h)

### Change Caps Lock to Ctrl

- tweaks > Keyboard & Mouse > Additional Layout Options > Ctrl Postion > check Caps Lock as Ctrl

### Change input language by Ctrl + Space

- TBD

## Development Settings

### Basic

```
sudo apt install -y curl git jq unzip xclip xsel
```

### Symbolic links

```zsh
# shell
ln -fs "$HOME/dotfiles/zsh" "$HOME/.zsh.d"
ln -fs "$HOME/dotfiles/os/ubuntu/zshrc" "$HOME/.zshrc"

# vim
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"

# neovim
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.config/nvim/init.vim"

# wezterm
mkdir -p ~/.config/wezterm
ln -fs "$HOME/dotfiles/config/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

# coc.nvim
mkdir -p ~/.config/coc/extensions
ln -fs "$HOME/dotfiles/config/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/config/vim/coc/coc-settings.json" "$HOME/.config/coc/coc-settings.json"
ln -fs "$HOME/dotfiles/config/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"

# ghq, git
ln -fs "$HOME/dotfiles/config/gitconfig" "$HOME/.gitconfig"

# pet
ln -fs "$HOME/dotfiles/config/pet/config.toml" "$HOME/.config/pet/config.toml"

# rbm
ln -fs "$HOME/dotfiles/config/rbm/rbm-bookmarks.toml" "$HOME/rbm-bookmarks.toml"
```

### Shell

#### zsh

```zsh
# zsh
sudo apt install -y zsh
chsh -s $(which zsh)
source ~/.zshrc

# zplug
mkdir ~/.zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
zplug install

# pure
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

### Programming Languages

#### anyenv

```zsh
git clone https://github.com/anyenv/anyenv ~/.anyenv
source ~/.zshrc
~/.anyenv/bin/anyenv init
yes | anyenv install --init
```

#### python, node.js, go

```zsh
anyenv install pyenv
exec $SHELL -l
pyenv install 3.9.7
pyenv global 3.9.7
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

anyenv install nodenv
exec $SHELL -l
nodenv install 16.15.0
nodenv global 16.15.0

anyenv install goenv
exec $SHELL -l
goenv install 1.16.0
goenv global 1.16.0
```

#### Rust

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### deno

```
curl -fsSL https://deno.land/install.sh | sh
```

### Neovim

#### Neovim

```zsh
sudo apt install -y neovim \
  build-essential \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  liblzma-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev
```

#### deps

```
pip3 install pynvim
pip3 instal neovim-remote
npm i -g neovim
```


### Other CLI Tools

```zsh
# useful cli tools
cargo install exa
cargo install ripgrep
cargo install --locked bat
go install github.com/mattn/efm-langserver@latest
go get github.com/x-motemen/ghq
wget https://github.com/knqyf263/pet/releases/download/v0.3.6/pet_0.3.6_linux_amd64.deb
sudo dpkg -i pet_0.3.6_linux_amd64.deb

# llvm, clang-format
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt install -y clang-format

```

### Nerd-fonts

see [https://github.com/ryanoasis/nerd-fonts](https://github.com/ryanoasis/nerd-fonts)

```zsh
git clone --depth 1
cd nerd-fonts
./install.sh RobotoMono
```

### wezterm

see [https://wezfurlong.org/wezterm/install/linux.html](https://wezfurlong.org/wezterm/install/linux.html)
