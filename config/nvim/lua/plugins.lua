local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    -- for profiling neovim startup
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      })
      vim.cmd([[packadd packer.nvim]])
    end
    vim.cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
  end

  -- Plugins
  local function plugins(use)
    use({ "wbthomason/packer.nvim" })

    -- Load only when require
    use({ "nvim-lua/plenary.nvim", module = "plenary" })

    -- Startup screen
    use({
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    })

    -- Color scheme
    use({
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
    })

    -- Dressing
    use({
      "stevearc/dressing.nvim",
      config = function()
        require("config.dressing").setup()
      end,
    })

    -- WhichKey
    use({
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    })

    -- IndentLine
    use({
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    })

    -- Better icons
    use({
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup({ default = true })
      end,
    })

    -- Status line
    use({
      "nvim-lualine/lualine.nvim",
      -- after = "nvim-treesitter",
      config = function()
        require("config.lualine").setup()
      end,
      requires = { "nvim-web-devicons" },
    })

    -- Buffer line
    use({
      "akinsho/nvim-bufferline.lua",
      event = "BufReadPre",
      wants = "nvim-web-devicons",
      config = function()
        require("config.bufferline").setup()
      end,
    })

    -- Git sign
    -- use({
    --   "lewis6991/gitsigns.nvim",
    --   requires = {
    --     { "nvim-lua/plenary.nvim", module = "plenary" },
    --   },
    --   event = "BufRead",
    --   cmd = "GitSigns",
    --   config = function()
    --     require("gitsigns").setup()
    --   end,
    -- })
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end,
    })

    -- File explorer
    use({
      "nvim-neo-tree/neo-tree.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        { "nvim-lua/plenary.nvim", module = "plenary" },
        { "MunifTanjim/nui.nvim", module = "nui" },
      },
      cmd = { "Neotree" },
      config = function()
        require("config.neotree").setup()
      end,
    })

    -- Easy hopping
    use({
      "phaazon/hop.nvim",
      cmd = { "HopWord", "HopChar1" },
      config = function()
        require("hop").setup()
      end,
    })

    -- Easy comment out
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    })

    -- Fuzzy finder
    use({
      "ibhagwan/fzf-lua",
      event = "BufEnter",
      wants = "nvim-web-devicons",
      config = function()
        require("config.fzf").setup()
      end,
      requires = { "junegunn/fzf", run = "./install --all" },
    })

    -- Completion
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/vim-vsnip",
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
        require("config.cmp").setup()
      end,
    })

    -- Auto pairs
    use({
      "windwp/nvim-autopairs",
      event = { "InsertEnter" },
      config = function()
        require("nvim-autopairs").setup({
          enable_check_bracket_line = false,
        })
      end,
    })

    -- LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use({ "j-hui/fidget.nvim", tag = "legacy" })
    use({
      "neovim/nvim-lspconfig",
      config = function()
        require("config.lsp").setup()
      end,
    })
    use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      after = "mason.nvim",
      config = function()
        require("config.lsp.null-ls").setup()
      end,
    })

    -- Rust
    use({ "simrat39/rust-tools.nvim" })
    use({
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
      config = function()
        require("crates").setup()
      end,
    })

    -- Markdown Preview
    use({
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    })

    -- Terminal
    use({
      "akinsho/toggleterm.nvim",
      tag = "*",
      config = function()
        require("config.toggleterm").setup()
      end,
    })

    if packer_bootstrap then
      print("Restart Neovim required after installation!")
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require("packer")
  packer.init(conf)
  packer.startup(plugins)
end

return M
