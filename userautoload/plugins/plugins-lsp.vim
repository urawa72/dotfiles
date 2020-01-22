""""""""""""""""""""""""""""""
" vim-lsp設定
""""""""""""""""""""""""""""""
" linter off
let g:lsp_diagnostics_enabled = 0
" auto complete
let g:lsp_async_completion = 1
" keymap
noremap <silent><C-]> :LspDefinition<CR>
""""""""""""""""""""""""""""""
