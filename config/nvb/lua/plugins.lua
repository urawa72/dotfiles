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

		-- Notification
		-- use({
		-- 	"rcarriga/nvim-notify",
		-- 	event = "VimEnter",
		-- 	config = function()
		-- 		vim.notify = require("notify")
		-- 	end,
		-- })

		-- Colorscheme
		use({
			"sainnhe/everforest",
			config = function()
				vim.cmd("colorscheme everforest")
			end,
		})

		-- Startup screen
		use({
			"goolord/alpha-nvim",
			config = function()
				require("config.alpha").setup()
			end,
		})

		-- Git
		use({
			"TimUntersberger/neogit",
			cmd = "NeoGit",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("config.neogit").setup()
			end,
		})
    use {
      "lewis6991/gitsigns.nvim",
      event = "BufReadPre",
      wants = "plenary.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config.gitsigns").setup()
      end,
    }
    use {
      "tpope/vim-fugitive",
      cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
      requires = { "tpope/vim-rhubarb" },
      -- wants = { "vim-rhubarb" },
    }

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

		-- Better Comment
		use({
			"numToStr/Comment.nvim",
			opt = true,
			keys = { "gc", "gcc", "gbc" },
			config = function()
				require("Comment").setup({})
			end,
		})

		-- Easy hopping
		use({
			"phaazon/hop.nvim",
			cmd = { "HopWord", "HopChar1" },
			config = function()
				require("hop").setup({})
			end,
		})

		-- Easy motion
		use({
			"ggandor/lightspeed.nvim",
			keys = { "s", "S", "f", "F", "t", "T" },
			config = function()
				require("lightspeed").setup({})
			end,
		})

		-- Markdown
		use({
			"iamcco/markdown-preview.nvim",
			run = function()
				vim.fn["mkdp#util#install"]()
			end,
			ft = "markdown",
			cmd = { "MarkdownPreview" },
		})

		-- Status line
		use({
			"nvim-lualine/lualine.nvim",
			after = "nvim-treesitter",
			config = function()
				require("config.lualine").setup()
			end,
			requires = { "nvim-web-devicons" },
		})
		use({
			"SmiteshP/nvim-gps",
			requires = "nvim-treesitter/nvim-treesitter",
			module = "nvim-gps",
			config = function()
				require("nvim-gps").setup()
			end,
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			opt = true,
			event = "BufRead",
			run = ":TSUpdate",
			config = function()
				require("config.treesitter").setup()
			end,
			requires = {
				{ "nvim-treesitter/nvim-treesitter-textobjects" },
			},
		})

		-- Fuzzy finder
    if PLUGINS.fzf_lua.enabled then
		  use {
        "ibhagwan/fzf-lua",
        event = "BufEnter",
        wants = "nvim-web-devicons",
				config = function()
					require("config.fzf").setup()
				end,
        requires = { "junegunn/fzf", run = "./install --all" },
      }
    end

		if PLUGINS.telescope.enabled then
			use({
				"nvim-telescope/telescope.nvim",
				opt = true,
				config = function()
					require("config.telescope").setup()
				end,
				cmd = { "Telescope" },
				module = "telescope",
				keys = { "<leader>f", "<leader>p" },
				wants = {
					"plenary.nvim",
					"popup.nvim",
					"telescope-fzf-native.nvim",
					"telescope-project.nvim",
					"telescope-repo.nvim",
					"telescope-file-browser.nvim",
					"project.nvim",
				},
				requires = {
					"nvim-lua/popup.nvim",
					"nvim-lua/plenary.nvim",
					{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
					"nvim-telescope/telescope-project.nvim",
					"cljoly/telescope-repo.nvim",
					"nvim-telescope/telescope-file-browser.nvim",
					{
						"ahmedkhalf/project.nvim",
						config = function()
							require("project_nvim").setup({})
						end,
					},
				},
			})
		end

		-- File explorer
		-- use({
		-- 	"kyazdani42/nvim-tree.lua",
		-- 	requires = {
		-- 		"kyazdani42/nvim-web-devicons",
		-- 	},
		-- 	cmd = { "NvimTreeToggle", "NvimTreeClose" },
		-- 	config = function()
		-- 		require("config.nvimtree").setup()
		-- 	end,
		-- })
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
        require("config.neotree").config()
      end,
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

		-- User interface
		-- use({
		-- 	"stevearc/dressing.nvim",
		-- 	event = "BufEnter",
		-- 	config = function()
		-- 		require("dressing").setup({
		-- 			select = {
		-- 				backend = { "telescope", "fzf", "builtin" },
		-- 			},
		-- 		})
		-- 	end,
		-- 	disable = true,
		-- })
		-- use({ "nvim-telescope/telescope.nvim", module = "telescope", as = "telescope" })

		use({
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			opt = true,
			config = function()
				require("config.cmp").setup()
			end,
			wants = { "LuaSnip" },
			requires = {
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
				"ray-x/cmp-treesitter",
				"hrsh7th/cmp-cmdline",
				"saadparwaiz1/cmp_luasnip",
				"hrsh7th/cmp-calc",
				"f3fora/cmp-spell",
				"hrsh7th/cmp-emoji",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-nvim-lsp-signature-help",
				{
					"L3MON4D3/LuaSnip",
					wants = "friendly-snippets",
					config = function()
						require("config.luasnip").setup()
					end,
				},
				"rafamadriz/friendly-snippets",
				disable = not PLUGINS.nvim_cmp.enabled,
			},
		})

		-- Auto pairs
		use({
			"windwp/nvim-autopairs",
			wants = "nvim-treesitter",
			module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
			config = function()
				require("config.autopairs").setup()
			end,
		})

		-- Auto tag
		use({
			"windwp/nvim-ts-autotag",
			wants = "nvim-treesitter",
			event = "InsertEnter",
			config = function()
				require("nvim-ts-autotag").setup({ enable = true })
			end,
		})

		-- End wise
		use({
			"RRethy/nvim-treesitter-endwise",
			wants = "nvim-treesitter",
			event = "InsertEnter",
		})

		-- LSP
		use {
			"neovim/nvim-lspconfig",
			opt = true,
			event = "BufReadPre",
			wants = { "nvim-lsp-installer", "cmp-nvim-lsp", "neodev.nvim", "vim-illuminate", "null-ls.nvim", "schemastore.nvim", "nvim-lsp-ts-utils" },
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
				"folke/neodev.nvim",
				"RRethy/vim-illuminate",
				"jose-elias-alvarez/null-ls.nvim",
				{
					"j-hui/fidget.nvim",
					config = function()
						require("fidget").setup {}
					end,
				},
				"b0o/schemastore.nvim",
        "jose-elias-alvarez/nvim-lsp-ts-utils",
			},
		}

    -- lsp progress ui
    use { "j-hui/fidget.nvim", module = "fidget" }

		-- trouble.nvim
		use {
			"folke/trouble.nvim",
			event = "BufReadPre",
			wants = "nvim-web-devicons",
			cmd = { "TroubleToggle", "Trouble" },
			config = function()
				require("trouble").setup {
					use_diagnostic_signs = true,
				}
			end,
		}

		-- lspsaga.nvim
		use {
			"tami5/lspsaga.nvim",
			event = "VimEnter",
			cmd = { "Lspsaga" },
			config = function()
				require("lspsaga").setup {}
			end,
		}

		-- Rust
		use {
			"simrat39/rust-tools.nvim",
			requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
			module = "rust-tools",
			ft = { "rust" },
			config = function()
				require("rust-tools").setup {}
			end,
		}

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
