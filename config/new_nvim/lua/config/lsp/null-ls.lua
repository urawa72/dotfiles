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
      null_ls.builtins.formatting.deno_fmt.with({
        condition = function(utils)
          return not (utils.has_file({ ".prettierrc", ".prettierrc.js", ".prettierrc.json", "deno.json", "deno.jsonc" }))
        end,
      }),
      -- null_ls.builtins.diagnostics.sqlfluff.with({
      --   extra_args = { "--dialect", "postgres", "--format", "json" },
      -- }),
      null_ls.builtins.formatting.sql_formatter,
      -- null_ls.builtins.formatting.pg_format,
      null_ls.builtins.formatting.stylua,
    },
    default_timeout = 10000,
    capabilities = common_config.capabilities,
    on_attach = common_config.on_attach,
  })
end

return M
