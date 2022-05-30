if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '~/.asdf/shims/python'


""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'b3nj5m1n/kommentary'
Plug 'Yggdroot/indentLine'
Plug '907th/vim-auto-save'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'markonm/traces.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


""""""""""""""""""""""""""""""
" Autocmd
""""""""""""""""""""""""""""""
augroup fileTypeSetting
  autocmd!
  au FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
  au FileType java setlocal tabstop=4 shiftwidth=4
  au FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType c setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType cpp setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType rust setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType typescript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType vue  setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  au FileType python let b:coc_root_patterns = ['.git', '.venv']
  au BufNewFile,BufRead *.ts setlocal filetype=typescript
  au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
augroup END

" highlight cursorline
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END

" opacity
if !has('gui_running')
  augroup opacity
    autocmd!
    autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
    autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
    autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
    autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
    autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
  augroup END
endif

" maintain cursor position
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END


""""""""""""""""""""""""""""""
" Basic
""""""""""""""""""""""""""""""
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
set foldmethod=marker
" set termguicolors
set t_BE=
syntax on
filetype on


""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""
colorscheme dracula
set background=dark
hi Pmenu ctermfg=lightgrey ctermbg=black
hi PmenuSel ctermfg=white ctermbg=darkgrey


""""""""""""""""""""""""""""""
" Key Mapping
""""""""""""""""""""""""""""""
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
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
" coc
let g:coc_node_path = expand('~/.asdf/shims/node')

set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use H to show documentation in preview window.
nnoremap <silent> H :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('H', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" nmap <silent>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" format code
nmap <silent> fmt <Plug>(coc-format)

" coc-rest-client
nnoremap <silent> <Leader>0 :CocCommand rest-client.request <CR>
let g:coc_explorer_global_presets = {
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\ }

" coc-explorer
nnoremap <silent> <space> :CocCommand explorer --preset floating<CR>


" fzf
let g:fzf_layout = { 'down': '~50%' }
nnoremap <expr><silent>ff (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
nnoremap <silent>rg :Rg<CR>
if executable('rg')
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'))
endif


" vim-airline
let g:lightline = { 'colorscheme': 'dracula' }
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#ignore_bufadd_pat =
  \ 'gundo|undotree|vimfiler|tagbar|nerd_tree|startify|!'


" ultisnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-Tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['~/.config/ultisnips']
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


" gitgutter
set updatetime=200


" indentLine
set list lcs=tab:\|\ 
let g:indentLine_fileTypeExclude = ['help', 'fern', 'term']


" auto-save
let g:auto_save = 1
