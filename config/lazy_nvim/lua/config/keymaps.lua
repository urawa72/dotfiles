local s = vim.keymap.set

s("n", "<leader>w", function()
  vim.cmd("update!")
end, { silent = true })
s("n", "<leader>g", function()
  LAZYGIT_TOGGLE()
end, { silent = true })
s("n", "<leader>f", function()
  vim.cmd("FzfLua files")
end, { silent = true })
s("n", "<leader>r", function()
  vim.cmd("FzfLua live_grep")
end, { silent = true })
s("n", "<leader>e", function()
  vim.cmd("Neotree toggle float reveal_force_cwd")
end, { silent = true })
s("n", "<leader>d", function()
  vim.diagnostic.open_float(0, { focusable = true, border = "rounded" })
end, { noremap = true, silent = true })

s("i", "jj", "<Esc>", { silent = true })
s("n", "<S-q>", ":q!<CR>", { silent = true })
s("n", "<S-b>", ":bd!<CR>", { silent = true })
s("n", "<C-j>", ":bprev<CR>", { silent = true })
s("n", "<C-k>", ":bnext<CR>", { silent = true })
s("n", "<C-e>", "$", { silent = true })
s("n", "<C-a>", "^", { silent = true })
s("v", "<C-e>", "$", { silent = true })
s("v", "<C-a>", "^", { silent = true })
s("i", "<C-f>", "<Right>", { silent = true })
s("i", "<C-b>", "<Left>", { silent = true })
s("i", "<C-k>", "<Up>", { silent = true })
s("i", "<C-j>", "<Down>", { silent = true })
s("i", "<C-e>", "<C-o>$", { silent = true })
s("i", "<C-a>", "<C-o>^", { silent = true })
s("n", "<Esc><Esc>", ":nohlsearch<CR>", { silent = true })
s("n", "tt", ":term<CR>", { silent = true })
s("t", "<Esc>", "<C-\\><C-n>", { silent = true })
s("t", "<C-f>", "<Right>", { silent = true })
s("t", "<C-b>", "<Left>", { silent = true })
s("t", "<C-e>", "<END>", { silent = true })
s("t", "<C-a>", "<HOME>", { silent = true })


vim.cmd([[
let g:vsnip_snippet_dir = expand('~/.vsnip')
" 補完のポップアップメニュー表示中
"   <CR> で候補を確定
inoremap <expr><CR> pumvisible() ? "\<c-y>" : "\<cr>"
" :h vsnip-mapping
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])
