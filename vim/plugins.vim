""""""""""""""""""""""""""""""
" プラグインのセットアップ
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
" Git
Plug 'tpope/vim-fugitive'
" コメントON/OFF
Plug 'tomtom/tcomment_vim'
" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'
" 自動保存
Plug '907th/vim-auto-save'
let g:auto_save = 1
" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
" CtrlPにag使う
Plug 'rking/ag.vim'
" LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
" snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" compile
Plug 'thinca/vim-quickrun', {'on': 'QuickRun'}
Plug 'Shougo/vimproc.vim', {'do': 'make'}
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" html
" Plug 'mattn/emmet-vim'
" color
Plug 'cocopon/iceberg.vim'
" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

""""""""""""""""""""""""""""""
" シンタックスハイライト
""""""""""""""""""""""""""""""
" Vue
Plug 'posva/vim-vue'
" typescript
Plug 'leafgarland/typescript-vim'
" javascript
Plug 'jelera/vim-javascript-syntax'
" css
Plug 'hail2u/vim-css3-syntax'
" slim
Plug 'slim-template/vim-slim'
" coffeescript
Plug 'kchmck/vim-coffee-script'
" nginx
Plug 'vim-scripts/nginx.vim'


call plug#end()
""""""""""""""""""""""""""""""
