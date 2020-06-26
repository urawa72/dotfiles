""""""""""""""""""""""""""""""
" Basic
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
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
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
" 右に分割
set splitright
" Tabによる補完
set wildmenu
" ファイル開くとき一覧
set wildmode=list:longest,full
" 文字コード
set encoding=utf-8
" 補完ウィンドウ
set completeopt=menuone,noinsert
" grep検索の実行後にQuickFix Listを表示する
" autocmd QuickFixCmdPost *grep* cwindow
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
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
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
" au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4
" au BufNewFile,BufRead *.cpp set tabstop=4 shiftwidth=4
" au BufRead,BufNewFile *.conf set ft=nginx
" au FileType vue syntax sync fromstart
"}}}

" popup{{{
" command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0), minheight: &lines/2 })
"}}}

" netrw有効化{{{
" filetype plugin on
" " ファイルツリーの表示形式
" let g:netrw_liststyle=3
" " ヘッダを非表示にする
" let g:netrw_banner=0
" " サイズを(K,M,G)で表示する
" let g:netrw_sizestyle="H"
" " 日付フォーマットを yyyy/mm/dd(曜日) hh:mm:ss で表示する
" let g:netrw_timefmt="%Y/%m/%d(%a) %H:%M:%S"
" " プレビューウィンドウを垂直分割で表示する
" let g:netrw_preview=1
"}}}


""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""
" Plugin読み込み{{{
if filereadable(expand('$HOME/dotfiles/vim/plugins.vim'))
   source $HOME/dotfiles/vim/plugins.vim
endi
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
" inoremap <C-k> <Up>
" inoremap <C-j> <Down>
" inoremap <C-f> <Right>
" inoremap <C-b> <Left>
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" 補完表示時Enterで改行しない
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr><C-n> pumvisible() ? "\<Down>" : "\<C-n>"
inoremap <expr><C-p> pumvisible() ? "\<Up>" : "\<C-p>"
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

" netrw{{{
" NERDTree使うため無効化
" noremap <silent><Space> :Ex<CR>
"}}}


""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""
" NERDTree設定{{{
noremap <silent><Space> :NERDTreeToggle<CR>
" noremap <silent><Tab> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"}}}

" vim-lsp設定{{{
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled = 1
let g:lsp_signs_enabled = 1
let g:lsp_async_completion = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_hint = {'text': '?'}
noremap <silent><C-]> :LspDefinition<CR>
noremap <silent> gD :LspReferences<CR>
" }}}

" asyncomplete設定{{{
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
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
let g:quickrun_config = {}
" 実行にかかった時間を表示する、非同期実行を行う
let g:quickrun_config._ = {
    \ 'outputter/error/success': 'buffer',
    \ 'outputter/error/error': 'quickfix',
    \ 'outputter/quickfix/open_cmd': 'copen',
    \ 'outputter/buffer/name' : 'quickrun_output',
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
" If you want :UltiSnipsEdit to split your window.
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
