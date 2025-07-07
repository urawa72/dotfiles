return {
  -- Load only when require
  { "nvim-lua/plenary.nvim" },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end
  },

  -- Color scheme
  {
    "EdenEast/nightfox.nvim",
    config = function()
      local options = {
        dim_inactive = true,
        transparent = true,
      }
      local palettes = {
        nightfox = {
          red = "#c94f6d",
        },
        nordfox = {
          comment = "#60728a",
        },
      }
      local specs = {
        nightfox = {
          syntax = {
            keyword = "magenta",
          },
        },
      }
      local groups = {
        all = {
          IncSearch = { bg = "palette.cyan" },
        },
      }
      require("nightfox").setup({
        options = options,
        palettes = palettes,
        specs = specs,
        groups = groups,
      })
      vim.cmd([[
          autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
          autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
          autocmd ColorScheme * highlight LineNr ctermbg=none guibg=none
          autocmd ColorScheme * highlight Folded ctermbg=none guibg=none
          autocmd ColorScheme * highlight EndOfBuffer ctermbg=none guibg=none
          autocmd ColorScheme * highlight! link FloatBorder NormalFloat
          highlight LspReferenceText  ctermbg=8 guibg=#206050
          highlight LspReferenceRead  ctermbg=8 guibg=#206050
          highlight LspReferenceWrite ctermbg=8 guibg=#206050
        ]])
      vim.cmd("colorscheme nightfox")
    end,
  },

  -- Better icons
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({ default = true })
    end,
  },

  -- Git sign
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Easy hopping
  {
    "phaazon/hop.nvim",
    cmd = { "HopWord", "HopChar1" },
    config = function()
      require("hop").setup()
    end,
  },

  -- Easy comment out
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    config = function()
      require("nvim-autopairs").setup({
        enable_check_bracket_line = false,
      })
    end,
  },

  -- Rust
  -- {
  --   "saecki/crates.nvim",
  --   tag = "stable",
  --   -- event = { "BufRead Cargo.toml" },
  --   -- requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
  --   config = function()
  --     require("crates").setup()
  --   end,
  -- }

  -- {
  --   "xbase-lab/xbase",
  --   run = "make install",
  --   requires = {
  --     "neovim/nvim-lspconfig",
  --     "stevearc/dressing.nvim",
  --   },
  --   config = function()
  --     require("xbase").setup({})
  --   end,
  -- },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- Terminal
  -- {
  --   "akinsho/toggleterm.nvim",
  --   tag = "*",
  --   config = function()
  --     require("config.toggleterm").setup()
  --   end,
  -- },

  -- GitHub Copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true

      local keymap = vim.keymap.set
      -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
      keymap(
        "i",
        "<C-g>",
        'copilot#Accept("<CR>")',
        { silent = true, expr = true, script = true, replace_keycodes = false }
      )
      keymap("i", "<C-j>", "<Plug>(copilot-next)")
      keymap("i", "<C-k>", "<Plug>(copilot-previous)")
      keymap("i", "<C-o>", "<Plug>(copilot-dismiss)")
      keymap("i", "<C-s>", "<Plug>(copilot-suggest)")
    end,
  }
}
