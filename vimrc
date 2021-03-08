if has('nvim')
  if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
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
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug '907th/vim-auto-save'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/vim-lexiv'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'shuntaka9576/preview-asciidoc.nvim', { 'do': 'yarn install' }
Plug 'shuntaka9576/preview-swagger.nvim', { 'do': 'yarn install' }
Plug 'markonm/traces.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
augroup fileTypeSetting
  autocmd!
  au FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
  au FileType cpp setlocal tabstop=4 shiftwidth=4
  au FileType java setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType python let b:coc_root_patterns = ['.git', '.venv']
  au BufNewFile,BufRead *.ts setlocal filetype=typescript
  au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
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
colorscheme iceberg
set background=dark
set cursorline


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
nnoremap <silent> tt :term<CR>
if exists(":tmap")
  tnoremap <Esc> <C-\><C-n>
endif

" vimrc
noremap <F5> :<C-u>edit $MYVIMRC<CR>
noremap <F6> :<C-u>source $MYVIMRC<CR> :source $MYVIMRC<CR>


""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""
" fern
let g:fern#renderer = "nerdfont"
let g:fern_git_status#disable_ignored = 1
let g:fern_git_status#disable_untracked = 0
let g:fern_git_status#disable_submodules = 1
let g:fern_git_status#disable_directories = 0
nnoremap <silent> <Space> :<C-u>Fern . -drawer -toggle -width=50<CR>
function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> ma <Plug>(fern-action-new-path)
  nmap <buffer> u <Plug>(fern-action-leave)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> q :<C-u>quit<CR>

  nmap <buffer><expr>
        \ <Plug>(fern-my-expand-or-enter)
        \ fern#smart#drawer(
        \   "\<Plug>(fern-open-or-expand)",
        \   "\<Plug>(fern-open-or-enter)",
        \ )
  nmap <buffer><expr>
        \ <Plug>(fern-my-collapse-or-leave)
        \ fern#smart#drawer(
        \   "\<Plug>(fern-action-collapse)",
        \   "\<Plug>(fern-action-leave)",
        \ )
  nmap <buffer><nowait> l <Plug>(fern-my-expand-or-enter)
  nmap <buffer><nowait> h <Plug>(fern-my-collapse-or-leave)
endfunction
augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END


" coc
let g:coc_node_path = expand('~/.anyenv/envs/nodenv/shims/node')
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> fmt <Plug>(coc-format)


" vim-airline
let g:lightline = { 'colorscheme': 'icebergDark' }
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#ignore_bufadd_pat =
  \ 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'


" vim-fugitive
noremap <silent> gs :Gstatus<CR>
noremap <silent> gl :vertical Glog<CR>
noremap <silent> gd :vertical Gdiff<CR>
noremap <silent> ga :Gwrite<CR>


" gitgutter
set updatetime=200
let g:gitgutter_override_sign_column_highlight = 0


" ultisnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['~/dotfiles/vim/ultisnips']
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'


" fzf
nnoremap <silent>ff :GFiles<CR>
nnoremap <leader>rg :Rg <C-r><C-w><CR>
nnoremap <silent> rg :Rg<CR>
if executable('rg')
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap'))
endif


" indent-color
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd! VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=darkgrey


" indentLine
set list lcs=tab:\|\ 
let g:indentLine_fileTypeExclude = ['help', 'fern', 'term']


" easymotion
map <C-p> <Plug>(easymotion-bd-w)
" map <C-p> <Plug>(easymotion-prefix)
" map <Leader>l <Plug>(easymotion-bd-jk)


" Emmet-vim
" let g:user_emmet_install_global = 0
" au FileType html,css,tsx,jsx EmmetInstall
let g:user_emmet_settings = {
\ 'typescript.tsx' : {
\     'extends' : 'jsx',
\ },
\}


" auto-save
let g:auto_save = 1
