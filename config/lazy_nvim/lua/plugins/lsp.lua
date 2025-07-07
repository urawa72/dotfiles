return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "simrat39/rust-tools.nvim"
  },
  config = function()
    require("mason").setup()
    require("fidget").setup()

    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local lsp_common = require("utils.lsp_common").setup()

    local sign = function(opts)
      vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = "",
      })
    end
    sign({ name = "DiagnosticSignError", text = "" })
    sign({ name = "DiagnosticSignWarn", text = "" })
    sign({ name = "DiagnosticSignHint", text = "" })
    sign({ name = "DiagnosticSignInfo", text = "" })

    vim.diagnostic.config({
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
    })
    vim.cmd([[
      set signcolumn=yes
      autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
      ]])


    lspconfig["sourcekit"].setup({
      on_attach = lsp_common.on_attach,
      capabilities = lsp_common.capabilities,
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "ts_ls",
        "eslint",
        "gopls",
        "rust_analyzer",
        "pyright",
        "ruff",
        "yamlls",
        "jsonls",
      }
    })

    local installed_servers = require("mason-lspconfig").get_installed_servers()
    for _, server_name in ipairs(installed_servers) do
      local opts = {
        on_attach = lsp_common.on_attach,
        capabilities = lsp_common.capabilities,
        flags = {
          debounce_text_changes = 150,
        },
      }

      if server_name == "tsserver" then
        opts.root_dir = require("lspconfig").util.root_pattern("package.json")
        opts.single_file_support = false
      end

      if server_name == "eslint" then
        opts.root_dir = require("lspconfig").util.root_pattern("package.json")
      end

      if server_name == "rust_analyzer" then
        opts.settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        }
        require("rust-tools").setup({ server = opts })
        goto continue
      end

      if server_name == "pyright" then
        opts.settings = {
          python = {
            venvPath = ".",
            pythonPath = "./.venv/bin/python",
            analysis = {
              extraPaths = { "." },
            },
          },
        }
      end

      require("lspconfig")[server_name].setup(opts)
      ::continue::
    end
  end,
}
