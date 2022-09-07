local create_setup = require("config.plugin.lsp.utils").create_setup

return create_setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    require("sqls").on_attach(client, bufnr)
  end,
}
