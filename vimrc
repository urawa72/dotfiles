if has('nvim')
  let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
  let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'
  call plug#begin('~/.local/share/nvim/plugged')
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/plugged')
endif
""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""
" NERDTree
Plug 'scrooloose/nerdtree'
" Git
Plug 'tpope/vim-fugitive'
" comment toggle
Plug 'tomtom/tcomment_vim'
" indent color
Plug 'nathanaelkane/vim-indent-guides'
" whitespace
Plug 'bronson/vim-trailing-whitespace'
" auto save
Plug '907th/vim-auto-save'
let g:auto_save = 1
" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
" use ag for CtrlP
Plug 'rking/ag.vim'
" easymotion
Plug 'easymotion/vim-easymotion'
" LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
" auto complete
Plug 'mattn/vim-lexiv'
" Linter
Plug 'dense-analysis/ale'
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
" devicons
Plug 'ryanoasis/vim-devicons'
" color
Plug 'cocopon/iceberg.vim'
" Plug 'ghifarit53/tokyonight-vim'
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
" rust
" Plug 'rust-lang/rust.vim', { 'for': ['rust'] }
" asciidoc/swagger
Plug 'shuntaka9576/preview-asciidoc.nvim', { 'do': 'yarn install' }
Plug 'shuntaka9576/preview-swagger.nvim', { 'do': 'yarn install' }
" prettier
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html']
"   \ }
" highlights
Plug 'markonm/traces.vim'
" golang imports/fmt
Plug 'mattn/vim-goimports'
" graphql
Plug 'jparise/vim-graphql'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
call plug#end()


""""""""""""""""""""""""""""""
" Basic
""""""""""""""""""""""""""""""
" 基本設定
set nowritebackup
set nobackup
set noswapfile
set noundofile
set cmdheight=1
set title
set showcmd
set smartcase
set hlsearch
set matchtime=3
set expandtab
set tabstop=2
set smarttab
set shiftwidth=2
set incsearch
set hidden
set list
set listchars=tab:>\ ,extends:<
set number
set showmatch
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
set clipboard+=unnamed
set virtualedit=all
set mouse=a
set wildmenu
set wildmode=list:longest,full
set encoding=UTF-8
set t_BE=
syntax on
filetype on

" 最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

" 拡張子ごと設定
augroup fileTypeIndent
  autocmd!
  au FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
  au FileType cpp setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au BufNewFile,BufRead *.json.jbuilder set ft=ruby
augroup END

" 自動的に閉じ括弧を入力
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o>


""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""
" basic
" set termguicolors
" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_enable_italic = 0
" let g:tokyonight_disable_italic_comment = 1
" let g:airline_theme = 'tokyonight'
" colorscheme tokyonight
colorscheme iceberg
set background=dark
set cursorline
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight VertSplit ctermbg=none
" highlight SignColumn ctermbg=none


""""""""""""""""""""""""""""""
" Key Mapping
""""""""""""""""""""""""""""""
" general
noremap g<C-a> <C-a>
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
nnoremap S :source %<CR>

" buffer
nnoremap <silent> <S-b> :bd!<CR>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" terminal
" nnoremap <silent> tt :term ++curwin ++close<CR>
nnoremap <silent> tt :term<CR>
if exists(":tmap")
  " tnoremap <Esc> <C-w><S-n>
  tnoremap <Esc> <C-\><C-n>
endif

" vimrc
noremap <F5> :<C-u>edit $MYVIMRC<CR>
noremap <F6> :<C-u>source $MYVIMRC<CR> :source $MYVIMRC<CR>


""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""
" NERDTree設定
noremap <silent><Space> :NERDTreeToggle<CR>
noremap <silent><Leader><Space> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeWinSize=70

" ale設定
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_fixers = ['prettier', 'eslint']
let g:ale_linters = {'rust': ['analyzer']}

" vim-lsp設定
let g:lsp_diagnostics_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_enabled = 1
let g:lsp_async_completion = 1
noremap <silent><C-]> :LspDefinition<CR>
noremap <silent> gD :LspReferences<CR>
noremap <silent><S-h> :LspHover<CR>
" python
let g:lsp_settings = {
\  'pyls-all': {
\    'workspace_config': {
\      'pyls-all': {
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

" asyncomplete設定
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 100
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr><C-n> pumvisible() ? "\<Down>" : "\<C-n>"
inoremap <expr><C-p> pumvisible() ? "\<Up>" : "\<C-p>"
imap <c-space> <Plug>(asyncomplete_force_refresh)
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" CtrlP設定
" let g:ctrlp_match_window = 'order:ttb,min:20,max:20,results:100' " マッチウインドウの設定. 「下部に表示, 大きさ20行で固定, 検索結果100件」
" let g:ctrlp_show_hidden = 1 " .(ドット)から始まるファイルも検索対象にする
" let g:ctrlp_regexp = 1 " あいまい検索利用しない
" let g:ctrlp_types = ['fil'] "ファイル検索のみ使用
" " 無視するディレクトリ・ファイル
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|vendor|node_module)$'
"   \}
" " ctrlP + ag
" if executable('ag')
"   let g:ctrlp_use_caching=0
"   let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
" endif

" vim-airline設定
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" QuickRun設定
" クリップボードを標準入力に渡す
nnoremap <silent><leader>r :QuickRun -input =@+<CR>
au FileType qf nnoremap <silent><buffer>q :quit<CR>
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

" vim-fugitive設定
noremap <silent> gs :Gstatus<CR>
noremap <silent> gl :vertical Glog<CR>
noremap <silent> gd :vertical Gdiff<CR>
noremap <silent> ga :Gwrite<CR>

" ultisnips設定
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['~/dotfiles/vim/ultisnips']

" fzf設定
nnoremap <silent>ff :Files<CR>
nnoremap <leader>rg :Rg <C-r><C-w><CR>
nnoremap <silent> rg :Rg<CR>
if executable('rg')
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap'))
endif

" Asyncrun設定
" 自動でQuickFix20行で開く
let g:asyncrun_open = 20

" vim-indent-guides設定
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd! VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey

" easymotion
map <Leader> <Plug>(easymotion-prefix)
map <Leader><Leader> <Plug>(easymotion-bd-w)
map <Leader>l <Plug>(easymotion-bd-jk)

" vim-clang-format設定
autocmd! FileType c,cpp,js,ts nnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd! FileType c,cpp,js,ts vnoremap <buffer><Leader>cf :ClangFormat<CR>
" autocmd! FileType cpp ClangFormatAutoEnable
