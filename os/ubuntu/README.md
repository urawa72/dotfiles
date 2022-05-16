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
sudo apt install -y curl git jq unzip
```

### Symbolic links

#### shell

```zsh
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
```

#### tmux

```
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/tmux/iceberg.tmux.conf" "$HOME/.tmux/iceberg.tmux.conf"
```

#### vim

```
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
```

#### neovim

```
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.config/nvim/init.vim"
```

#### alacritty

```
mkdir -p ~/.config/alacritty
ln -fs "$HOME/dotfiles/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
```

#### coc.nvim

```
ln -fs "$HOME/dotfiles/configs/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/configs/vim/coc/coc-settings.json" "$HOME/.config/coc/coc-settings.json"
ln -fs "$HOME/dotfiles/configs/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"
```

#### ghq, git

```
ln -fs "$HOME/dotfiles/configs/gitconfig" "$HOME/.gitconfig"
```

#### pet

```
mkdir -p ~/.config/pet
ln -fs "$HOME/dotfiles/configs/pet/config.toml" "$HOME/.config/pet/config.toml"
```

### Shell

#### zsh

```zsh
sudo apt install -y zsh
chsh -s $(which zsh)
```

#### zplug

```
mkdir ~/.zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
zplug install
```

#### tmux

```
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo apt install -y xclip xsel
```

#### pure

```
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

#### nodenv, rbenv, pyenv

```
anyenv install nodenv
anyenv install rbenv
anyenv install pyenv
```

#### goenv

```
mkdir $HOME/go
anyenv install goenv
goenv install 1.16.0
goenv global 1.16.0

```

#### Rust

```
sudo apt install -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### deno

```
curl -fsSL https://deno.land/install.sh | sh
```

### Neovim

#### Neovim

```zsh
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin
sudo ln -snf /usr/local/bin/nvim.appimage /usr/local/bin/nvim
```

#### python deps

```
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
pyenv install 3.8.5
pyenv install 2.7.18
pyenv virtualenv 3.8.5 neovim3
pyenv virtualenv 2.7.18 neovim2
pyenv shell neovim3
pip install pynvim
pyenv shell neovim2
pip install pynvim
pyenv global 3.8.5
pip3 install neovim-remote
```

#### ruby deps

```
rbenv install 3.1.2
rbenv global 3.1.2
gem install neovim

```

#### node.js deps

```
nodenv install 16.15.0
nodenv global 16.15.0
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

### alacritty

see [https://github.com/alacritty/alacritty/blob/master/INSTALL.md](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
