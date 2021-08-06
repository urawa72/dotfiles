# Setup steps for Ubuntu

## Hardware Settings

### basic
- install gnome-tweaks
```zsh
sudo apt install -y gnome-tweaks
```
- tweaks > Keyboard & Mouse > enable Emacs Input (can backspace with ctrl + h)

### change Caps Lock to Ctrl

- tweaks > Keyboard & Mouse > Additional Layout Options > Ctrl Postion > check Caps Lock as Ctrl


## Development Settings

### symbolic links

```zsh
# shell
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

# tmux
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/tmux/iceberg.tmux.conf" "$HOME/.tmux/iceberg.tmux.conf"

# for vim
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/vim/coc/coc-settings.json" "$HOME/.config/coc/coc-settings.json"

# for neovim
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/vimrc.vim" "$HOME/.config/nvim/init.vim"
ln -fs "$HOME/dotfiles/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"

# for coc
ln -fs "$HOME/dotfiles/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"

# alacritty
mkdir -p ~/.config/alacritty
ln -fs "$HOME/dotfiles/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
```

### zsh, zplug, tmux, pure

```zsh
# zsh
apt install -y zsh
chsh -s $(which zsh)

# zplug
mkdir ~/.zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME
zplug install

# tmux
sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# pure
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

### anyenv, languages

```zsh
# anyenv
git clone https://github.com/anyenv/anyenv ~/.anyenv
source ~/.zshrc
~/.anyenv/bin/anyenv init
yes | anyenv install --init

# other envs
anyenv install nodenv
anyenv install rbenv
anyenv install pyenv

# Go
mkdir $HOME/go
anyenv install goenv
goenv install 1.16.0
goenv global 1.16.0

# Rust
sudo apt install -y curl
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### neovim

```zsh
# neovim
apt install -y neovim \
  build-essential \
  libffi-dev \
  libssl-dev \
  zlib1g-dev \
  liblzma-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev

# python deps
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

# ruby deps
rbenv install 2.7.1
rbenv global 2.7.1
sudo gem install neovim

# node.js deps
nodenv install 14.16.0
nodenv global 14.16.0
sudo npm i -g neovim
```

### other tools

```zsh
cargo install exa
cargo install ripgrep
cargo install --locked bat
go get github.com/x-motemen/ghq
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt install -y xclip
```

### alacritty

see [https://github.com/alacritty/alacritty/blob/master/INSTALL.md](https://github.com/alacritty/alacritty/blob/master/INSTALL.md)
