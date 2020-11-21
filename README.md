## Make Symblic links
```
mkdir -p ~/.config/nvim
ln -fs "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -fs "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
ln -fs "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -fs "$HOME/dotfiles/vimrc.vim" "$HOME/.config/nvim/init.vim"
ln -fs "$HOME/dotfiles/vim/coc/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
ln -fs "$HOME/dotfiles/vim/coc/package.json" "$HOME/.config/coc/extensions/package.json"
ln -fs "$HOME/dotfiles/starship.toml" "$HOME/.config/starship.toml"
```

## Install zsh, powerline, starship
```
sudo apt install -y zsh powerline fonts-powerline
sudo curl -fsSL https://starship.rs/install.sh | bash
```

## Install tmux, themepack
- Install plugins with `prefix + I`

```
sudo apt install -y automake bison build-essential pkg-config libevent-dev libncurses5-dev
git clone https://github.com/tmux/tmux /usr/local/src/tmux
cd /usr/local/src/tmux
sudo ./autogen.sh
sudo ./configure --prefix=/usr/local
sudo make
sudo make install
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Vim
### Build
- ref：https://vim-jp.org/docs/build_linux.html

```
sudo apt install -y \
  gettext \
  libtinfo-dev \
  libacl1-dev \
  libgpm-dev \
  build-essential \
  libperl-dev \
  python-dev \
  python3-dev \
  ruby-dev \
  lua5.2 \
  liblua5.2-dev \
  autoconf \
  automake \
  cproto

# for +clipboard
sudo apt install -y libxmu-dev libgtk-3-dev libxpm-dev

cd /tmp
git clone https://github.com/vim/vim.git
cd vim
sudo ./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-cscope \
  --enable-fontset \
  --enable-fail-if-missing \
  --enable-pythoninterp=dynamic \
  --enable-python3interp=dynamic \
  --enable-rubyinterp=dynamic \
  --enable-gui=auto \
  --enable-gtk2-check \
  --with-x
sudo make && make install
```

## WSL
### make symbolic link
`/mnt/c/User/user_name/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json`
