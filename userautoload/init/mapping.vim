""""""""""""""""""""""""""""
" キーマッピング
""""""""""""""""""""""""""""""
" line/word
nmap <S-q> :q<CR>
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
" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>
" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>
" window/tab
nnoremap s <Nop>
nnoremap ss :vsplit<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sj gT
nnoremap sk gt
" buffer関連
nnoremap <silent> <S-l> :ls<CR>
nnoremap <silent> <S-b> :bd<CR>
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
" terminal
nnoremap <silent> tt :vert term<CR>
""""""""""""""""""""""""""""""
