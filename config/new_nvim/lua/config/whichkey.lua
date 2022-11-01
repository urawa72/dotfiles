local M = {}

function M.setup()
	local whichkey = require("which-key")

	local conf = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	}

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },
		["e"] = { "<cmd>Neotree toggle float reveal_force_cwd<cr>", "Explorer" },

		b = {
			name = "Buffer",
			c = { "<Cmd>bd!<Cr>", "Close Buffer" },
			D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete All Buffers" },
		},

		f = {
			name = "Find",
			f = { "<cmd>FzfLua files<cr>", "Files" },
			b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
			o = { "<cmd>FzfLua oldfiles<cr>", "Old Files" },
			g = { "<cmd>FzfLua live_grep<cr>", "Live Grep" },
			c = { "<cmd>FzfLua commands<cr>", "Commands" },
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			p = { "<cmd>PackerProfile<cr>", "Profile" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},

		-- g = {
		--   name = "Git",
		--   s = { "<cmd>Neogit<CR>", "Status" },
		-- },
	}

	whichkey.setup(conf)
	whichkey.register(mappings, opts)
end

return M
