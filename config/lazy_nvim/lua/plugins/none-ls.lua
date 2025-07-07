return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "mason-org/mason.nvim" },
  config = function()
    local lsp_common = require("utils.lsp_common").setup()
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
      capabilities = lsp_common.capabilities,
      on_attach = lsp_common.on_attach,
    })
  end,
}
