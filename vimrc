""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""
" all plugins {{{
" vimplugなければインストール
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
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
" }}}


""""""""""""""""""""""""""""""
" Basic
""""""""""""""""""""""""""""""
" Swapファイルやbackupファイル無効化
set nowritebackup
set nobackup
set noswapfile
" undoファイルは作成しない
set noundofile
" コマンドラインに使われる画面上の行数
set cmdheight=1
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
" タブ入力を複数の空白入力に置き換える
set expandtab
" タブ文字の表示幅
set tabstop=2
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" 挿入するインデントの幅
set shiftwidth=2
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
" 構文毎に文字色を変化させる
syntax on
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
" Tabによる補完
set wildmenu
" ファイル開くとき一覧
set wildmode=list:longest,full
" 文字コード
set encoding=utf-8
" terminal modeでCommand-Vでペースト
set t_BE=
" filetypeの自動検出
filetype on

" 最後のカーソル位置を復元する{{{
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
"}}}

" 自動的に閉じ括弧を入力{{{
" inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
"}}}

" 拡張子ごと設定{{{
augroup fileTypeIndent
  autocmd!
  au FileType go setlocal tabstop=4 shiftwidth=4
  au FileType cpp setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby
augroup END
"}}}


""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""
" basic{{{
colorscheme iceberg
set cursorline
"}}}


""""""""""""""""""""""""""""""
" Key Mapping
""""""""""""""""""""""""""""""
" line/word{{{
noremap <S-q> :q!<CR>
nnoremap <C-e> $
nnoremap <C-a> ^
vnoremap <C-e> $
vnoremap <C-a> ^
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap jj <Esc>
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
"}}}

" buffer{{{
nnoremap <silent> <S-l> :ls<CR>
nnoremap <silent> <S-b> :bd!<CR>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
"}}}

" terminal{{{
nnoremap <silent> tt :term ++curwin ++close<CR>
if exists(":tmap")
  tnoremap <Esc> <C-w><S-n>
endif
"}}}


""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""
" NERDTree設定{{{
noremap <silent><Space> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"}}}

" vim-lsp設定{{{
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_enabled = 1
let g:lsp_async_completion = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_hint = {'text': '?'}
noremap <silent><C-]> :LspDefinition<CR>
noremap <silent> gD :LspReferences<CR>

" python
let g:lsp_settings = {
\  'pyls': {
\    'workspace_config': {
\      'pyls': {
\        'configurationSources': ['flake8'],
\        'plugins': {
\          'pycodestyle': {'enabled': v:false},
\          'pydocstyle': {'enabled': v:false},
\          'pylint': {'enabled': v:false},
\          'flake8': {'enabled': v:true},
\          'jedi_definition': {
\            'follow_imports': v:true,
\            'follow_builtin_imports': v:true,
\          },
\        }
\      }
\    }
\  }
\}
" }}}

" asyncomplete設定{{{
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr><C-n> pumvisible() ? "\<Down>" : "\<C-n>"
inoremap <expr><C-p> pumvisible() ? "\<Up>" : "\<C-p>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"}}}

" CtrlP設定{{{
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
"}}}

" vim-airline設定{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
"}}}

" QuickRun設定{{{
" クリップボードを標準入力に渡す
nnoremap <silent><leader>r :QuickRun -input =@+<CR>
au FileType qf nnoremap <silent><buffer>q :quit<CR>
let g:quickrun_config = {}
" 実行にかかった時間を表示する、非同期実行を行う
let g:quickrun_config._ = {
    \ 'outputter/error/success': 'buffer',
    \ 'outputter/error/error': 'quickfix',
    \ 'outputter/quickfix/open_cmd': 'copen',
    \ 'outputter/buffer/close_on_empty' : 1,
    \ 'runner': 'vimproc',
    \ 'runner/vimproc/updatetime': 10,
    \ 'hook/time/enable': 1
    \ }
" 非同期実行を行わない
let g:quickrun_config.cpp = {
    \ 'command': 'g++',
    \ 'runner': 'system'
    \ }
"}}}

" vim-fugitive設定{{{
noremap <silent> gs :Gstatus<CR>
noremap <silent> gl :vertical Glog<CR>
noremap <silent> gd :vertical Gdiff<CR>
noremap <silent> ga :Gwrite<CR>
"}}}

" utilsnips設定{{{
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['~/dotfiles/vim/utilsnips']
"}}}

" fzf設定{{{
" 拝借したコマンド
nnoremap <silent> rg :Rg<CR>
if executable('rg')
    command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
        \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap'))
endif
"}}}

" Asyncrun設定{{{
" 自動でQuickFix20行で開く
let g:asyncrun_open = 20
"}}}

" vim-indent-guides設定{{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey
"}}}


""""""""""""""""""""""""""""""
" Other
""""""""""""""""""""""""""""""


" vim: tw=78 sw=4 foldmethod=marker
