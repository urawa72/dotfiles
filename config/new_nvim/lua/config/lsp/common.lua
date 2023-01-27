local M = {}

function M.setup()
	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	return {
		on_attach = function(client, bufnr)
			-- if client.server_capabilities.documentSymbolProvider then
			--   require("nvim-navic").attach(client, bufnr)
			-- end
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, bufopts)
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
			vim.keymap.set("n", "rn", vim.lsp.buf.rename, bufopts)
			vim.keymap.set("n", "ca", vim.lsp.buf.code_action, bufopts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
			vim.keymap.set("n", "fmt", vim.lsp.buf.format, bufopts)
		end,
		capabilities = capabilities,
	}
end

return M
