local M = {}

function M.setup()
  local common_config = require("config.lsp.common").setup()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.prettier.with({
        condition = function(utils)
          if vim.bo.filetype == "markdown" then
            return true
          else
            return utils.has_file({ ".prettierrc", ".prettierrc.js", ".prettierrc.json" })
          end
        end,
        prefer_local = "node_modules/.bin",
      }),
      null_ls.builtins.formatting.sql_formatter,
      -- lua
      null_ls.builtins.formatting.stylua,
      -- python
      null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.formatting.black,
      -- textlint
      null_ls.builtins.formatting.textlint,
    },
    default_timeout = 10000,
    capabilities = common_config.capabilities,
    on_attach = common_config.on_attach,
  })
end

return M
