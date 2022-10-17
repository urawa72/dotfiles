local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = "",
  })
end
sign { name = "DiagnosticSignError", text = "" }
sign { name = "DiagnosticSignWarn", text = "" }
sign { name = "DiagnosticSignHint", text = "" }
sign { name = "DiagnosticSignInfo", text = "" }
vim.diagnostic.config {
  virtual_text = false,
  virtual_lines = false,
  signs = true,
  update_in_insert = true,
  underline = true,
  severity_sort = false,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}
vim.cmd [[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]]

require("mason").setup()
-- require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
  function(server)
    local opt = {
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "fmt", "<cmd>lua vim.lsp.buf.format {async=true}<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      end,

      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
    require("lspconfig")[server].setup(opt)
  end,
}

-- local index = require "mason-registry.index"
-- index["sed"] = "mason-custom-registry.sed"
-- index["gitui"] = "mason-custom-registry.gitui"
-- index["ripgrep"] = "mason-custom-registry.ripgrep"

-- local ensure_installed = {
--   "lua-language-server",
--   "stylua",
--   "ripgrep",
--   -- "gitui",
-- }
--
-- if require("config.utils").is_win then
--   table.insert(ensure_installed, "sed")
-- end

-- require("mason-tool-installer").setup {
--   ensure_installed = ensure_installed,
--   auto_update = false,
--   run_on_start = true,
--   start_delay = 3000,
-- }
-- require("mason-tool-installer").run_on_start()
