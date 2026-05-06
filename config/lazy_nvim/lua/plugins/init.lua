return {
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
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = { default = true },
  },

  -- Git sign
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },

  -- Easy comment out
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    opts = {
      enable_check_bracket_line = false,
    },
  },

  -- Markdown
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
}
