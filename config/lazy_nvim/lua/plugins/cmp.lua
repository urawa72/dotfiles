return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/vim-vsnip",
    "hrsh7th/vim-vsnip-integ",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-calc",
    "f3fora/cmp-spell",
    "onsails/lspkind-nvim",
  },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
      }),
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          with_text = false,
          menu = {
            nvim_lsp = "[LSP]",
            -- luasnip = "[snippet]",
            vsnip = "[snippet]",
            buffer = "[buffer]",
            copilot = "[copilot]",
            calc = "[calc]",
            path = "[path]",
          },
        }),
      },
      experimental = {
        ghost_text = true,
      },
    })
  end,
}
