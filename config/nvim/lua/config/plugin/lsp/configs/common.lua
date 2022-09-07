local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

return {
  on_attach = function(client, bufnr)
    -- require("lsp_signature").on_attach()
    -- require("aerial").on_attach(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      require("nvim-navic").attach(client, bufnr)
    end
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

    -- vim.api.nvim_create_augroup("LspFormat" .. bufnr, {})
    -- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    --   group = "LspFormat" .. bufnr,
    --   buffer = bufnr,
    --   callback = function()
    --     vim.lsp.buf.format { timeout_ms = 7000, async = false }
    --   end,
    -- })
  end,
  capabilities = capabilities,
  -- handlers = {
  --   ["textDocument/hover"] = function(_, result, ctx, config)
  --     local util = require "vim.lsp.util"
  --     config = config or {}
  --     config.focus_id = ctx.method
  --     if not (result and result.contents) then
  --       return
  --     end
  --     local markdown_lines = util.convert_input_to_markdown_lines(result.contents, {})
  --     markdown_lines = util.trim_empty_lines(markdown_lines)
  --     if vim.tbl_isempty(markdown_lines) then
  --       return
  --     end
  --     return util.open_floating_preview(markdown_lines, "markdown", { border = "rounded" })
  --   end,
  -- },
}
