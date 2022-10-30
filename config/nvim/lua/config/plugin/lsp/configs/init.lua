local create_setup = require("config.plugin.lsp.utils").create_setup

local function no_formatting(client)
  client.server_capabilities.documentFormattingProvider = false
end

return {
  tsserver = require "config.plugin.lsp.configs.tsserver",
  denols = require "config.plugin.lsp.configs.denols",
  cssls = create_setup { on_attach = no_formatting },
  html = create_setup { on_attach = no_formatting },
  jsonls = create_setup {
    on_attach = no_formatting,
    filetypes = { "json", "jsonc" },
    settings = { json = { schemas = require("schemastore").json.schemas() } },
  },
  sumneko_lua = require "config.plugin.lsp.configs.sumneko_lua",
  rust_analyzer = require "config.plugin.lsp.configs.rust_analyzer",
  texlab = require "config.plugin.lsp.configs.texlab",
  sqls = require "config.plugin.lsp.configs.sqls",
  fsautocomplete = require "config.plugin.lsp.configs.fsautocomplete",
  eslint = create_setup(),
  sql_formatter = create_setup(),
}
