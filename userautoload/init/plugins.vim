""""""""""""""""""""""""""""""
" プラグインのセットアップ
" 追加:PlugInstall
" 削除:PlugClean
""""""""""""""""""""""""""""""
" vimplugなければインストール
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""
" 全般
""""""""""""""""""""""""""""""
" NERDTree
Plug 'scrooloose/nerdtree'
" Gitを便利に使う
Plug 'tpope/vim-fugitive'
" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'
" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'
" 自動保存
Plug '907th/vim-auto-save'
let g:auto_save = 1
" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
" CtrlPにag使う
Plug 'rking/ag.vim'
" CtrlPの拡張プラグイン. 関数検索
Plug 'tacahiroy/ctrlp-funky'
" CtrlPの拡張プラグイン. コマンド履歴検索
Plug 'suy/vim-ctrlp-commandline'
" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" スニペット
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
" カラーステータス
Plug 'itchyny/lightline.vim'
" マルチカーソル
Plug 'terryma/vim-multiple-cursors'
" endを自動挿入
Plug 'tpope/vim-endwise'
" Linter
Plug 'dense-analysis/ale'
" Tab補完
Plug 'ervandew/supertab'


""""""""""""""""""""""""""""""
" シンタックスハイライト
""""""""""""""""""""""""""""""
" Vue
Plug 'posva/vim-vue'
" typescript
Plug 'leafgarland/typescript-vim'
" javascript
Plug 'jelera/vim-javascript-syntax'
" stylus
Plug 'wavded/vim-stylus'
" slim
Plug 'slim-template/vim-slim'
" coffeescript
Plug 'kchmck/vim-coffee-script'


call plug#end()
""""""""""""""""""""""""""""""
