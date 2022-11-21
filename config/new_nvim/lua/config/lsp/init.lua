local M = {}

function M.setup()
	require("mason").setup()

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

	require("fidget").setup({
		text = {
			spinner = "dots",
		},
	})

	local common_config = require("config.lsp.common").setup()
	local mason_lspconfig = require("mason-lspconfig")

	mason_lspconfig.setup({
		ensure_installed = {
			"sumneko_lua",
			"rust_analyzer",
			"tsserver",
			"jdtls",
		},
		automatic_installation = true,
	})

	mason_lspconfig.setup_handlers({
		function(server_name)
			local opts = {
				on_attach = common_config.on_attach,
				capabilities = common_config.capabilities, -- for nvim-cmp
				flags = {
					debounce_text_changes = 150,
				},
			}

			if server_name == "rust_analyzer" then
				opts.settings = {
					["rust-analyzer"] = {
						checkOnSave = {
							command = "clippy",
						},
					},
				}
				require("rust-tools").setup({ server = opts })
			end

			require("lspconfig")[server_name].setup(opts)
		end,
	})
end

return M
