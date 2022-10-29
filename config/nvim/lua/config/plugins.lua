local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path }
  vim.api.nvim_command "packadd packer.nvim"
end

local packer = require "packer"

packer.startup {
  function(use)
    use { "wbthomason/packer.nvim" }

    ------------------------------------------
    -- Global plugins --
    ------------------------------------------
    use { "lewis6991/impatient.nvim" }
    -- use {
    --   "rcarriga/nvim-notify",
    --   module = "notify",
    --   setup = function()
    --     require("config.plugin.notify").setup()
    --   end,
    --   config = function()
    --     require("config.plugin.notify").config()
    --   end,
    -- }

    ----------
    -- Code --
    ----------
    use {
      "nvim-treesitter/nvim-treesitter",
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
      event = { "BufRead", "InsertEnter" },
      module = { "nvim-treesitter" },
      requires = {
        { "romgrk/nvim-treesitter-context", after = "nvim-treesitter" },
        { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },
        { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
      },
      config = function()
        require "config.plugin.treesitter"
      end,
    }
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
      module = "null-ls",
      after = "mason.nvim",
    }
    use {
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
      config = function()
        vim.g.code_action_menu_show_details = false
      end,
    }
    use {
      "neovim/nvim-lspconfig",
      module = "lspconfig",
      cmd = { "LspInfo", "LspLog" },
      event = { "BufRead" },
      config = function()
        require "config.plugin.lsp.setup"
      end,
    }

    -- VScode like icons
    use { "onsails/lspkind-nvim", module = "lspkind" }

    -- lsp progress ui
    use { "j-hui/fidget.nvim", module = "fidget" }

    -- statusline component
    use { "SmiteshP/nvim-navic", module = "nvim-navic" }

    -- project spcecified lsp settings
    use { "tamago324/nlsp-settings.nvim", module = "nlspsettings", cmd = "LspSettings" }

    -- manage lsp servers
    use {
      "williamboman/mason.nvim",
      module = { "mason" },
      cmd = { "Mason", "MasonInstall", "Mason*" },
      config = function()
        require "config.plugin.mason"
      end,
    }
    use { "williamboman/mason-lspconfig.nvim", module = { "mason-lspconfig" } }
    use {
      "L3MON4D3/LuaSnip",
      requires = {
        { "rafamadriz/friendly-snippets" },
      },
      config = function()
        require "config.plugin.luasnip"
      end,
      event = "InsertEnter",
    }
    -- completion engine
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
        { "hrsh7th/cmp-calc", after = "nvim-cmp" },
        { "hrsh7th/cmp-path", after = "nvim-cmp" },
        { "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
        { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      },
      event = { "InsertEnter", "CmdlineEnter" },
      cmd = { "CmpStatus" },
      config = function()
        require "config.plugin.cmp"
      end,
    }

    -- easy comment out
    use {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end,
    }

    -----------------
    -- Move / Edit --
    -----------------
    -- easy motion like jump
    use {
      "phaazon/hop.nvim",
      cmd = "Hop*",
      setup = function()
        require("config.plugin.hop").setup()
      end,
      config = function()
        require("config.plugin.hop").config()
      end,
    }

    -- insert char pairs auto
    use {
      "windwp/nvim-autopairs",
      event = { "InsertEnter" },
      after = { "nvim-cmp" },
      config = function()
        require("nvim-autopairs").setup {
          enable_check_bracket_line = false,
        }
      end,
    }

    -----------
    -- Utils --
    -----------
    -- fuzzy finder
    use {
      "ibhagwan/fzf-lua",
      requires = {
        { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
      },
      setup = function()
        require("config.plugin.fzf-lua").setup()
      end,
    }

    -- file explorer
    use {
      "nvim-neo-tree/neo-tree.nvim",
      requires = {
        { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
        { "nvim-lua/plenary.nvim", module = "plenary" },
        { "MunifTanjim/nui.nvim", module = "nui" },
      },
      cmd = { "Neotree" },
      setup = function()
        require("config.plugin.neo-tree").setup()
      end,
      config = function()
        require("config.plugin.neo-tree").config()
      end,
    }

    -- pretty list
    use {
      "folke/trouble.nvim",
      requires = { { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" } },
      cmd = "Trouble*",
      setup = function()
        require("config.plugin.trouble").setup()
      end,
      config = function()
        require("config.plugin.trouble").config()
      end,
    }

    -- git decorations
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        { "nvim-lua/plenary.nvim", module = "plenary" },
      },
      event = "BufRead",
      cmd = "GitSigns",
      config = function()
        require("gitsigns").setup()
      end,
    }

    -- magit for neovim
    use {
      "TimUntersberger/neogit",
      cmd = { "Neogit" },
      module = { "neogit" },
      config = function()
        require("neogit").setup {
          enhanced_diff_hl = true,
          integrations = {
            diffview = true,
          },
          signs = {
            section = { "", "" },
            item = { "", "" },
          },
        }
      end,
    }

    -- git diff view
    use {
      "sindrets/diffview.nvim",
      requires = "nvim-lua/plenary.nvim",
      cmd = { "Diffview*", "DiffviewOpen" },
      module = "diffview",
    }

    ----------------
    -- Appearance --
    ----------------
    use "EdenEast/nightfox.nvim"

    use {
      "stevearc/dressing.nvim",
      config = function()
        require "config.plugin.dressing"
      end,
    }

    use {
      "akinsho/bufferline.nvim",
      tag = "v2.*",
      requires = "kyazdani42/nvim-web-devicons",
      setup = function()
        -- require "config.plugin.bufferline"
        require("bufferline").setup {
          options = {
            diagnostics = "nvim_lsp",
            show_buffer_close_icons = false,
            show_close_icon = false,
            separator_style = { "|", " " },
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
              local icon = level:match "error" and " " or " "
              return " " .. icon .. count
            end,
          },
          highlights = {
            buffer_selected = {
              fg = "#fdf6e3",
              bold = true,
              italic = true,
            },
          },
        }
      end,
    }
    use {
      "nvim-lualine/lualine.nvim",
      setup = function()
        -- require "config.plugin.lualine"
        require("lualine").setup {
          options = {
            theme = "nightfox",
          },
        }
      end,
    }

    use {
      "lukas-reineke/indent-blankline.nvim",
      event = { "BufRead" },
      config = function()
        require "config.plugin.indent-blankline"
      end,
    }

    -----------
    -- Tools --
    -----------
    use { "sbulav/nredir.nvim", cmd = { "Nredir" } }
    use { "dstein64/vim-startuptime", cmd = { "StartupTime" } }

    -------------------------------
    -- Language specific plugins --
    -------------------------------
    use { "kevinoid/vim-jsonc", ft = { "json" } }

    use {
      "ionide/Ionide-vim",
      module = "ionide",
      setup = function()
        vim.g["fsharp#lsp_auto_setup"] = 0
      end,
    }

    use { "simrat39/rust-tools.nvim", module = "rust-tools" }

    use {
      "Saecki/crates.nvim",
      event = { "BufRead Cargo.toml" },
      requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
      config = function()
        require("crates").setup()
      end,
    }

    -- lua dev
    use { "folke/neodev.nvim", module = "neodev" }

    -- TypeScript utils
    use { "jose-elias-alvarez/nvim-lsp-ts-utils", module = "nvim-lsp-ts-utils" }

    -- json SchemaStore catalog
    use { "b0o/schemastore.nvim", module = "schemastore" }


    use {
      "vuki656/package-info.nvim",
      event = { "BufRead package.json" },
      requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
    }

    use {
      "NTBBloodbath/rest.nvim",
      requires = { { "nvim-lua/plenary.nvim", module = "plenary" } },
      ft = { "http" },
    }

    use {
      "f3fora/nvim-texlabconfig",
      config = function()
        require("texlabconfig").setup()
      end,
      ft = { "tex", "bib" },
      cmd = { "TexlabInverseSearch" },
    }

    use {
      "nanotee/sqls.nvim",
      module = "sqls",
      ft = { "sql" },
    }

    use {
      "ellisonleao/glow.nvim",
      ft = { "markdown" },
      cmd = { "Glow" },
      config = function()
        require("glow").setup {
          border = "single",
        }
      end,
    }
  end,
}

vim.api.nvim_create_augroup("PackerCompile", {})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = "PackerCompile",
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
  once = false,
})
