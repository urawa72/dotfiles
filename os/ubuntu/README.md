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
ln -fs "$HOME/dotfiles/config/zsh/" "$HOME/.config/zsh"
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

# wezterm
ln -fs "$HOME/dotfiles/config/wezterm/" "$HOME/.config/wezterm"

# neovim
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/config/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# ultisnips
ln -fs "$HOME/dotfiles/config/ultisnips/" "$HOME/.config/ultisnips"

# coc.nvim
ln -fs "$HOME/dotfiles/config/coc/" "$HOME/.config/coc"

# ghq, git
ln -fs "$HOME/dotfiles/config/gitconfig" "$HOME/.gitconfig"

# pet
ln -fs "$HOME/dotfiles/config/pet/" "$HOME/.config/pet"

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

# pure
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
```

### Programming Languages

#### with asdf

```zsh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 16.15.0
asdf global nodejs 16.15.0

asdf plugin add python https://github.com/danhper/asdf-python.git
asdf install python 3.9.13
asdf global python 3.9.13

asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby 2.7.6
asdf global ruby 2.7.6

asdf plugin add golang https://github.com/kennyp/asdf-golang.git
asdf install golang latest
asdf global golang latest
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
sudo apt install -y fuse libfuse2
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin
sudo ln -snf /usr/local/bin/nvim.appimage /usr/local/bin/nvim
```

#### deps

```
pip install pynvim
pip instal neovim-remote
npm i -g neovim
gem install neovim
```


### Other CLI Tools

```zsh
# useful cli tools
sudo apt install -y exa
cargo install ripgrep
cargo install --locked bat
go install github.com/mattn/efm-langserver@latest
go install github.com/x-motemen/ghq@latest 
wget https://github.com/knqyf263/pet/releases/download/v0.3.6/pet_0.3.6_linux_amd64.deb
sudo dpkg -i pet_0.3.6_linux_amd64.deb

# llvm, clang-format
sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
sudo apt install -y clang-format
```

### docker

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ja

```zsh
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG
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
