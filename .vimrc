""""""""""""""""""""""""""""
" キーバインド
""""""""""""""""""""""""""""""
" line/word
nmap <S-q> :wq<CR>
nmap <C-e> $
nmap <C-a> 0
vmap <C-e> $
vmap <C-a> 0
imap <C-k> <Up>
imap <C-j> <Down>
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-e> <C-o>$
imap <C-a> <C-o>0
" window/tab
nnoremap s <Nop>
nnoremap ss :vsplit<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sj gT
nnoremap sk gt
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" NERDTree
noremap <silent><Space> :NERDTreeToggle<CR>
" buffer関連
nnoremap <silent> <S-l> :ls<CR>
nnoremap <silent> <S-b> :bd<CR>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" プラグインのセットアップ
" 追加:PlugInstall
" 削除:PlugClean
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

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
" 多機能セレクタ
Plug 'ctrlpvim/ctrlp.vim'
" CtrlPの拡張プラグイン. 関数検索
Plug 'tacahiroy/ctrlp-funky'
" CtrlPの拡張プラグイン. コマンド履歴検索
Plug 'suy/vim-ctrlp-commandline'
" CtrlPにag使う
Plug 'rking/ag.vim'
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
" Ruby向けにendを自動挿入してくれる
Plug 'tpope/vim-endwise'
" マルチカーソル
Plug 'terryma/vim-multiple-cursors'
" Vue
Plug 'posva/vim-vue'
" typescript
Plug 'leafgarland/typescript-vim'
" javascript
Plug 'jelera/vim-javascript-syntax'
" stylus
Plug 'wavded/vim-stylus'


call plug#end()
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" Swapファイルやbackupファイル無効化
set nowritebackup
set nobackup
set noswapfile
" undoファイルは作成しない
set noundofile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
if isdirectory(expand('~/.vim/bundle/vim-fugitive'))
  set statusline+=%{fugitive#statusline()}
endif
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" 入力中のコマンドを表示する
set showcmd
" 小文字のみで検索したときに大文字小文字を無視する
set smartcase
" 検索結果をハイライト表示する
set hlsearch
" 対応括弧のハイライト表示を3秒にする
set matchtime=3
" 暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch
" 保存されていないファイルがあるときでも別のファイルを開けるようにする
set hidden
" 不可視文字を表示する
set list
" タブと行の続きを可視化する
set listchars=tab:>\ ,extends:<
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" 構文毎に文字色を変化させる
syntax on
" coloer scheme / cursorline
colorscheme hybrid
let g:hybrid_use_iTerm_colors = 1
set cursorline
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" ヤンクでクリップボードにコピー
set clipboard+=unnamed
" カーソルを文字が存在しない部分でも動けるようにする
set virtualedit=all
" マウスを有効にする
set mouse=a
" terminalを常に下部に表示するため
set splitbelow
" terminal大きくならないように
set termwinsize=8x0
" ファイル開くとき一覧
set wildmenu wildmode=list:full
" 文字コード
set encoding=utf-8
" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" CtrlPの設定
""""""""""""""""""""""""""""""
let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
let g:ctrlp_regexp = 1 " あいまい検索利用しない
let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
" 無視するディレクトリ・ファイル
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|vendor|node_module)$'
  \}
" ctrlP + ag
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" スニペット設定
""""""""""""""""""""""""""""""
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/'
imap <C-p>     <Plug>(neosnippet_expand_or_jump)
smap <C-p>     <Plug>(neosnippet_expand_or_jump)
xmap <C-p>     <Plug>(neosnippet_expand_target)
""""""""""""""""""""""""""""""

" filetypeの自動検出
filetype on
