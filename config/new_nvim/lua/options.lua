local opt = vim.opt

-- Behavior
opt.shortmess:append("I")
opt.mouse = "a"
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
  }
end
opt.clipboard:append("unnamedplus")
opt.undofile = true
opt.confirm = true
opt.autoread = true
opt.smartcase = true
opt.ignorecase = true
opt.inccommand = "split"
opt.foldlevel = 99
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.updatetime = 300
-- Key
opt.timeoutlen = 300
-- Editing
opt.completeopt = "menuone,noselect"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
-- Appearance
opt.title = true
opt.number = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.sidescrolloff = 16
opt.list = true
opt.winblend = 15
opt.pumblend = 15
opt.virtualedit = "all"

-- Remap leader and local leader to <Space>
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.cmd([[autocmd FileType help wincmd L]])

vim.cmd([[
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = '~/.asdf/shims/python'
]])

vim.cmd([[
" highlight cursorline
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI,WinLeave * setlocal nocursorline
  autocmd CursorHold,CursorHoldI * setlocal cursorline
augroup END
" maintain cursor position
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line('$') |
    \   exe "normal! g`\"" |
    \ endif
augroup END
]])
