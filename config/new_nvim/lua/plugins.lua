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
        vim.cmd("colorscheme nightfox")
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

    -- LSP
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use({
      "neovim/nvim-lspconfig",
      requires = {
        "j-hui/fidget.nvim"
      },
      config = function()
        require("config.lsp").setup()
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
