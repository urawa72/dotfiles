require("options")
require("keymaps")
require("plugins").setup()

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("terminal")
    vim.cmd("startinsert")
  end
})
