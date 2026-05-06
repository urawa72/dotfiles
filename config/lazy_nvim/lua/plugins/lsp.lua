return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    require("mason").setup()
    require("fidget").setup()

    local lsp_common = require("utils.lsp_common").setup()

    vim.diagnostic.config({
      virtual_text = false,
      virtual_lines = false,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
    vim.cmd([[
      set signcolumn=yes
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
    ]])

    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls", "ts_ls", "eslint", "gopls", "rust_analyzer",
        "pyright", "ruff", "yamlls", "jsonls",
      },
    })

    vim.lsp.config("gopls", {
      on_attach = lsp_common.on_attach,
      capabilities = lsp_common.capabilities,
      flags = { debounce_text_changes = 150 },
    })

    vim.lsp.config("ts_ls", {
      on_attach = lsp_common.on_attach,
      capabilities = lsp_common.capabilities,
      root_dir = require("lspconfig.util").root_pattern("package.json"),
      single_file_support = false,
      flags = { debounce_text_changes = 150 },
    })

    vim.lsp.config("eslint", {
      on_attach = lsp_common.on_attach,
      capabilities = lsp_common.capabilities,
      root_dir = require("lspconfig.util").root_pattern("package.json"),
      flags = { debounce_text_changes = 150 },
    })

    vim.lsp.config("pyright", {
      on_attach = lsp_common.on_attach,
      capabilities = lsp_common.capabilities,
      settings = {
        python = {
          venvPath = ".",
          pythonPath = "./.venv/bin/python",
          analysis = { extraPaths = { "." } },
        },
      },
      flags = { debounce_text_changes = 150 },
    })

    vim.lsp.config("rust_analyzer", {
      on_attach = lsp_common.on_attach,
      capabilities = lsp_common.capabilities,
      settings = {
        ["rust-analyzer"] = { checkOnSave = { command = "clippy" } },
      },
      flags = { debounce_text_changes = 150 },
    })

    vim.lsp.config("sourcekit", {
      on_attach = lsp_common.on_attach,
      capabilities = lsp_common.capabilities,
      flags = { debounce_text_changes = 150 },
    })
  end,
}
