## zsh
- zsh, poweline, oh-my-zshをインストールする

```
sudo apt install -y zsh powerline fonts-powerline
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
source $ZSH/oh-my-zsh.sh
```


## tmux
- tmux, themepackをインストールする

```
sudo apt install -y automake bison build-essential pkg-config libevent-dev libncurses5-dev
git clone https://github.com/tmux/tmux /usr/local/src/tmux
cd /usr/local/src/tmux
sudo ./autogen.sh
sudo ./configure --prefix=/usr/local
sudo make & make install
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


## Vim
- ソースコードからビルド・インストールする
- 参考：https://vim-jp.org/docs/build_linux.html

```
# 依存ライブラリ
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

# +clipboardのために必要
sudo apt install -y libxmu-dev libgtk-3-dev libxpm-dev

# ソースをクローンしてインストール
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


## settings.jsonの配置
- ``にあるsettings.jsonのシンボリックリンクをホームディレクトリに作成する
- サンプルを元に編集する



## その他
- LSP clangd これで解決
  - https://github.com/mattn/vim-lsp-settings/issues/69
