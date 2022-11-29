local create_setup = require("config.plugin.lsp.utils").create_setup

return create_setup(require("neodev").setup {
  library = {
    enabled = true,
    runtime = true,
    types = true,
    plugins = true,
  },
  lspconfig = true,
  -- lspconfig = {
  --   settings = {
  --     Lua = {
  --       diagnostics = {
  --         globals = { "vim" },
  --       },
  --     },
  --   },
  --   on_attach = function(client)
  --     client.server_capabilities.documentFormattingProvider = false
  --   end,
  -- },
})
