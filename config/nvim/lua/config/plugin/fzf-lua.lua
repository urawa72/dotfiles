return {
  setup = function()
    require("fzf-lua").setup { winopts = {
      height = 0.4,
      width = 1.0,
      row = 1.0,
    } }
    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap("n", "fb", "<cmd>lua require('fzf-lua').buffers()<CR>", opts)
    vim.api.nvim_set_keymap("n", "ff", "<cmd>lua require('fzf-lua').files()<CR>", opts)
    vim.api.nvim_set_keymap("n", "rg", "<cmd>lua require('fzf-lua').grep_project()<CR>", opts)
  end,
}
