return {
  setup = function()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "fb", "<cmd>lua require('fzf-lua').buffers()<CR>", opts)
    vim.api.nvim_set_keymap("n", "ff", "<cmd>lua require('fzf-lua').files()<CR>", opts)
    vim.api.nvim_set_keymap("n", "rg", "<cmd>lua require('fzf-lua').grep_project()<CR>", opts)
  end,
}
