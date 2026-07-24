local M = {}

local mode_names = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  ["\22"] = "V-BLOCK",
  c = "COMMAND",
  R = "REPLACE",
  t = "TERMINAL",
}

local function apply_highlights()
  local set = vim.api.nvim_set_hl
  for _, group in ipairs({ "Normal", "NormalNC", "NonText", "LineNr", "Folded", "EndOfBuffer" }) do
    set(0, group, { bg = "none" })
  end
  set(0, "FloatBorder", { link = "NormalFloat" })
  set(0, "LspReferenceText", { bg = "#206050" })
  set(0, "LspReferenceRead", { bg = "#206050" })
  set(0, "LspReferenceWrite", { bg = "#206050" })
end

function M.statusline()
  local mode = mode_names[vim.fn.mode(1)] or vim.fn.mode(1):upper()
  local diagnostics = {}
  for _, severity in ipairs({ vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN }) do
    local count = #vim.diagnostic.get(0, { severity = severity })
    if count > 0 then
      table.insert(diagnostics, (severity == vim.diagnostic.severity.ERROR and "E:" or "W:") .. count)
    end
  end

  local modified = vim.bo.modified and " [+]" or ""
  local diagnostic_text = #diagnostics > 0 and " " .. table.concat(diagnostics, " ") or ""
  return string.format(" %s | %%f%s%s %%=%%l:%%c %%p%%%% ", mode, modified, diagnostic_text)
end

function M.tabline()
  local current = vim.api.nvim_get_current_buf()
  local tabs = {}

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[bufnr].buflisted then
      local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")
      if name == "" then
        name = "[No Name]"
      end
      if vim.bo[bufnr].modified then
        name = name .. " +"
      end
      local group = bufnr == current and "%#TabLineSel#" or "%#TabLine#"
      table.insert(tabs, string.format("%s %d:%s ", group, bufnr, name:gsub("%%", "%%%%")))
    end
  end

  return table.concat(tabs, "%#TabLineFill#")
end

vim.cmd.colorscheme("habamax")
apply_highlights()
vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_highlights })
vim.opt.statusline = "%!v:lua.require('config.ui').statusline()"
vim.opt.tabline = "%!v:lua.require('config.ui').tabline()"
vim.opt.showtabline = 2

return M
