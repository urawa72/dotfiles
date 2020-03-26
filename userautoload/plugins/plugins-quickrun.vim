" キーマップの設定
" クリップボードを標準入力に渡す
nnoremap <silent><leader>r :QuickRun -input =@+<CR>
let g:quickrun_config = {}

" 実行にかかった時間を表示する
" 非同期実行を行う
let g:quickrun_config._ = {
    \ 'outputter/error/success': 'buffer',
    \ 'outputter/error/error': 'quickfix',
    \ 'outputter/quickfix/open_cmd': 'copen',
    \ 'runner': 'vimproc',
    \ 'runner/vimproc/updatetime': 10,
    \ 'hook/time/enable': 1
    \ }

" inputというファイルを標準入力として与える
" 非同期実行を行わない
let g:quickrun_config.cpp = {
    \ 'command': 'g++',
    \ 'runner': 'system'
    \ }
