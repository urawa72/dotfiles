require("options")
require("keymaps")
require("plugins").setup()

vim.cmd('autocmd VimEnter * lua require("fzf-lua").files()')
