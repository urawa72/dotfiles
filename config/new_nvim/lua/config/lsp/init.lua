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
		function(server)
			require("lspconfig")[server].setup(common_config)
		end,
	})
end

return M
