if has('nvim')
  if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  let g:loaded_python_provider = 0
  let g:loaded_perl_provider = 0
  let g:loaded_ruby_provider = 0
  let g:python3_host_prog = '~/.anyenv/envs/pyenv/shims/python3'
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
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug '907th/vim-auto-save'
Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'cocopon/iceberg.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pantharshit00/vim-prisma'
Plug 'cespare/vim-toml'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'markonm/traces.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-denops/denops.vim'
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
set splitright
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set t_BE=
syntax on
filetype on

" 拡張子ごと設定
augroup fileTypeSetting
  autocmd!
  au FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
  au FileType java setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType c setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType python let b:coc_root_patterns = ['.git', '.venv']
  au BufNewFile,BufRead *.ts setlocal filetype=typescript
  au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
augroup END

augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

" Open terminal on new buffer
" autocmd VimEnter * if @% == '' && s:GetBufByte() == 0 | call Term()
" function! s:GetBufByte()
"   let byte = line2byte(line('$') + 1)
"   if byte == -1
"     return 0
"   else
"     return byte - 1
"   endif
" endfunction
"
" function! Term()
"   call termopen(&shell)
" endfunction


""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""
" basic
colorscheme iceberg
set background=dark
" Change popup menu color for non selected items
hi Pmenu ctermfg=lightgrey ctermbg=black
" Change popup menu color for selected item
hi PmenuSel ctermfg=white ctermbg=darkgrey


""""""""""""""""""""""""""""""
" Key Mapping
""""""""""""""""""""""""""""""
" general
noremap g<C-a> <C-a>
noremap <S-q> :q!<CR>
noremap <S-w> :w<CR>
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
" expand path
cmap <C-x> <C-r>=expand('%:p:h')<CR>/
" expand file (not ext)
cmap <C-z> <C-r>=expand('%:p:r')<CR>

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
" coc
let g:coc_node_path = expand('~/.anyenv/envs/nodenv/shims/node')
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <silent> fmt <Plug>(coc-format)
nmap <silent><S-h> :<C-u>call CocAction('doHover')<CR>
nnoremap <silent> fmts :CocCommand stylelintplus.applyAutoFixes<CR>
nnoremap <silent> <Leader>0 :CocCommand rest-client.request <CR>
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }
nnoremap <silent> <space> :CocCommand explorer --preset floating<CR>
" see https://github.com/fannheyward/coc-pyright/issues/99
if !empty($VIRTUAL_ENV)
  call coc#config('python', {
  \   'pythonPath': $VIRTUAL_ENV . '/bin/python',
  \   'sortImports.path': $VIRTUAL_ENV . '/bin/isort'
  \ })
endif


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
let g:UltiSnipsSnippetDirectories=['~/dotfiles/configs/vim/ultisnips']
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
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
nnoremap <expr><silent>ff (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
nnoremap <silent>sp :Snippets<CR>
nnoremap <silent>rg :Rg<CR>


" indentLine
set list lcs=tab:\|\ 
let g:indentLine_fileTypeExclude = ['help', 'fern', 'term']


" easymotion
" map  f <Plug>(easymotion-bd-w)
map f <Plug>(easymotion-overwin-w)


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
