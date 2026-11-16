local M = {}

--------------------------------------------------------------------------------
-- 1. Nightfox Palette & Highlights (habamax base + transparent background)
--------------------------------------------------------------------------------
local palette = {
  bg = "none",
  bg_alt = "#192330",
  fg = "#cdcecf",
  fg_alt = "#738091",
  comment = "#738091",
  cyan = "#63cdcf",
  blue = "#719cd6",
  green = "#81b29a",
  yellow = "#dbc074",
  orange = "#f4a261",
  red = "#c94f6d",
  magenta = "#9d79d6",
  pink = "#d67ad2",
  white = "#dfdfe0",
  black = "#131a24",
  sel = "#2b3b51",
  dim = "#212e3f",
  border = "#38475c",
}

local function apply_highlights()
  local set = vim.api.nvim_set_hl

  -- 透過背景 (Transparent Background)
  local transparent_groups = {
    "Normal",
    "NormalNC",
    "SignColumn",
    "LineNr",
    "CursorLineNr",
    "Folded",
    "FoldColumn",
    "EndOfBuffer",
    "NonText",
    "SpecialKey",
    "StatusLine",
    "StatusLineNC",
    "TabLine",
    "TabLineFill",
    "WinSeparator",
    "VertSplit",
    "MsgArea",
  }
  for _, group in ipairs(transparent_groups) do
    set(0, group, { bg = "none" })
  end

  -- Float / Popup
  set(0, "NormalFloat", { bg = "none", fg = palette.fg })
  set(0, "FloatBorder", { bg = "none", fg = palette.blue })
  set(0, "FloatTitle", { bg = "none", fg = palette.yellow, bold = true })
  set(0, "Pmenu", { bg = palette.bg_alt, fg = palette.fg })
  set(0, "PmenuSel", { bg = palette.sel, fg = palette.white, bold = true })
  set(0, "PmenuSbar", { bg = palette.bg_alt })
  set(0, "PmenuThumb", { bg = palette.border })

  -- Nightfox 風シンタックスハイライト
  set(0, "Comment", { fg = palette.comment, italic = true })
  set(0, "Constant", { fg = palette.orange })
  set(0, "String", { fg = palette.green })
  set(0, "Character", { fg = palette.green })
  set(0, "Number", { fg = palette.orange })
  set(0, "Boolean", { fg = palette.orange })
  set(0, "Float", { fg = palette.orange })
  set(0, "Identifier", { fg = palette.white })
  set(0, "Function", { fg = palette.blue })
  set(0, "Statement", { fg = palette.magenta })
  set(0, "Conditional", { fg = palette.magenta })
  set(0, "Repeat", { fg = palette.magenta })
  set(0, "Label", { fg = palette.magenta })
  set(0, "Operator", { fg = palette.cyan })
  set(0, "Keyword", { fg = palette.magenta })
  set(0, "Exception", { fg = palette.red })
  set(0, "PreProc", { fg = palette.yellow })
  set(0, "Include", { fg = palette.magenta })
  set(0, "Define", { fg = palette.magenta })
  set(0, "Macro", { fg = palette.magenta })
  set(0, "PreCondit", { fg = palette.yellow })
  set(0, "Type", { fg = palette.yellow })
  set(0, "StorageClass", { fg = palette.yellow })
  set(0, "Structure", { fg = palette.yellow })
  set(0, "Typedef", { fg = palette.yellow })
  set(0, "Special", { fg = palette.cyan })
  set(0, "SpecialChar", { fg = palette.cyan })
  set(0, "Delimiter", { fg = palette.fg_alt })
  set(0, "SpecialComment", { fg = palette.comment, bold = true })
  set(0, "Error", { fg = palette.red, bold = true })
  set(0, "Todo", { fg = palette.yellow, bold = true })

  -- 検索・選択・カーソル行
  set(0, "Visual", { bg = palette.sel })
  set(0, "Search", { bg = palette.sel, fg = palette.white })
  set(0, "IncSearch", { bg = palette.cyan, fg = palette.black, bold = true })
  set(0, "CurSearch", { bg = palette.cyan, fg = palette.black, bold = true })
  set(0, "CursorLine", { bg = "#1a222d" })
  set(0, "ColorColumn", { bg = "#1a222d" })

  -- LSP / Diagnostics
  set(0, "DiagnosticError", { fg = palette.red })
  set(0, "DiagnosticWarn", { fg = palette.yellow })
  set(0, "DiagnosticInfo", { fg = palette.blue })
  set(0, "DiagnosticHint", { fg = palette.cyan })
  set(0, "DiagnosticUnderlineError", { undercurl = true, sp = palette.red })
  set(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = palette.yellow })
  set(0, "DiagnosticUnderlineInfo", { undercurl = true, sp = palette.blue })
  set(0, "DiagnosticUnderlineHint", { undercurl = true, sp = palette.cyan })
  set(0, "LspReferenceText", { bg = palette.sel })
  set(0, "LspReferenceRead", { bg = palette.sel })
  set(0, "LspReferenceWrite", { bg = palette.sel })

  -- Git signs / Diff
  set(0, "GitSignsAdd", { fg = palette.green })
  set(0, "GitSignsChange", { fg = palette.blue })
  set(0, "GitSignsDelete", { fg = palette.red })
  set(0, "diffAdded", { fg = palette.green })
  set(0, "diffChanged", { fg = palette.blue })
  set(0, "diffRemoved", { fg = palette.red })

  -- StatusLine 用ハイライト
  set(0, "SLModeNormal", { bg = palette.blue, fg = palette.black, bold = true })
  set(0, "SLModeInsert", { bg = palette.green, fg = palette.black, bold = true })
  set(0, "SLModeVisual", { bg = palette.magenta, fg = palette.black, bold = true })
  set(0, "SLModeCommand", { bg = palette.yellow, fg = palette.black, bold = true })
  set(0, "SLModeReplace", { bg = palette.red, fg = palette.black, bold = true })
  set(0, "SLModeTerminal", { bg = palette.cyan, fg = palette.black, bold = true })
  set(0, "SLModeOther", { bg = palette.comment, fg = palette.black, bold = true })

  set(0, "SLGit", { fg = palette.magenta, bold = true })
  set(0, "SLFile", { fg = palette.white, bold = true })
  set(0, "SLModified", { fg = palette.orange, bold = true })
  set(0, "SLReadOnly", { fg = palette.red, bold = true })
  set(0, "SLFileType", { fg = palette.cyan })
  set(0, "SLEncoding", { fg = palette.fg_alt })
  set(0, "SLPos", { bg = palette.sel, fg = palette.white, bold = true })
  set(0, "SLDiagError", { fg = palette.red, bold = true })
  set(0, "SLDiagWarn", { fg = palette.yellow, bold = true })
  set(0, "SLSep", { fg = palette.border })

  -- TabLine 用ハイライト
  set(0, "TabLineSel", { bg = palette.sel, fg = palette.white, bold = true })
  set(0, "TLBufActive", { bg = palette.sel, fg = palette.white, bold = true })
  set(0, "TLBufInactive", { bg = "none", fg = palette.comment })
  set(0, "TLModActive", { bg = palette.sel, fg = palette.orange, bold = true })
  set(0, "TLModInactive", { bg = "none", fg = palette.orange })
  set(0, "TLDiagErrorActive", { bg = palette.sel, fg = palette.red, bold = true })
  set(0, "TLDiagErrorInactive", { bg = "none", fg = palette.red })
  set(0, "TLDiagWarnActive", { bg = palette.sel, fg = palette.yellow, bold = true })
  set(0, "TLDiagWarnInactive", { bg = "none", fg = palette.yellow })
end

-- ベースカラースキームに habamax を適用
vim.cmd.colorscheme("habamax")
apply_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("ConfigUIHighlights", { clear = true }),
  callback = apply_highlights,
})

--------------------------------------------------------------------------------
-- 2. Asynchronous Git Branch Cache
--------------------------------------------------------------------------------
local git_branch_cache = {}
local git_fetching = {}

local function update_git_branch(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local dir
  if bufname and bufname ~= "" and not bufname:match("^%a+://") then
    dir = vim.fs.dirname(bufname)
  else
    dir = vim.fn.getcwd()
  end

  if not dir or dir == "" or git_fetching[dir] then
    return
  end

  git_fetching[dir] = true

  vim.system(
    { "git", "rev-parse", "--abbrev-ref", "HEAD" },
    { cwd = dir, text = true },
    function(res)
      git_fetching[dir] = nil
      local branch = ""
      if res.code == 0 and res.stdout then
        local out = vim.trim(res.stdout)
        if out == "HEAD" then
          branch = "HEAD"
        elseif out ~= "" then
          branch = out
        end
      end

      if git_branch_cache[dir] ~= branch then
        git_branch_cache[dir] = branch
        vim.schedule(function()
          vim.cmd("redrawstatus")
        end)
      end
    end
  )
end

local function get_git_branch()
  local bufname = vim.api.nvim_buf_get_name(0)
  local dir
  if bufname and bufname ~= "" and not bufname:match("^%a+://") then
    dir = vim.fs.dirname(bufname)
  else
    dir = vim.fn.getcwd()
  end
  return git_branch_cache[dir] or ""
end

local git_group = vim.api.nvim_create_augroup("ConfigUIGitBranch", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "DirChanged", "FocusGained" }, {
  group = git_group,
  callback = function(ev)
    update_git_branch(ev.buf)
  end,
})

--------------------------------------------------------------------------------
-- 3. Custom Statusline (mode, async git branch, file info, cursor position)
--------------------------------------------------------------------------------
local mode_map = {
  ["n"]      = { text = "NORMAL",    hl = "%#SLModeNormal#" },
  ["no"]     = { text = "O-PENDING", hl = "%#SLModeNormal#" },
  ["nov"]    = { text = "O-PENDING", hl = "%#SLModeNormal#" },
  ["noV"]    = { text = "O-PENDING", hl = "%#SLModeNormal#" },
  ["no\22"]  = { text = "O-PENDING", hl = "%#SLModeNormal#" },
  ["niI"]    = { text = "NORMAL",    hl = "%#SLModeNormal#" },
  ["niR"]    = { text = "NORMAL",    hl = "%#SLModeNormal#" },
  ["niV"]    = { text = "NORMAL",    hl = "%#SLModeNormal#" },
  ["nt"]     = { text = "NORMAL",    hl = "%#SLModeNormal#" },
  ["v"]      = { text = "VISUAL",    hl = "%#SLModeVisual#" },
  ["vs"]     = { text = "VISUAL",    hl = "%#SLModeVisual#" },
  ["V"]      = { text = "V-LINE",    hl = "%#SLModeVisual#" },
  ["Vs"]     = { text = "V-LINE",    hl = "%#SLModeVisual#" },
  ["\22"]    = { text = "V-BLOCK",   hl = "%#SLModeVisual#" },
  ["\22s"]   = { text = "V-BLOCK",   hl = "%#SLModeVisual#" },
  ["s"]      = { text = "SELECT",    hl = "%#SLModeVisual#" },
  ["S"]      = { text = "S-LINE",    hl = "%#SLModeVisual#" },
  ["\19"]    = { text = "S-BLOCK",   hl = "%#SLModeVisual#" },
  ["i"]      = { text = "INSERT",    hl = "%#SLModeInsert#" },
  ["ic"]     = { text = "INSERT",    hl = "%#SLModeInsert#" },
  ["ix"]     = { text = "INSERT",    hl = "%#SLModeInsert#" },
  ["R"]      = { text = "REPLACE",   hl = "%#SLModeReplace#" },
  ["Rc"]     = { text = "REPLACE",   hl = "%#SLModeReplace#" },
  ["Rx"]     = { text = "REPLACE",   hl = "%#SLModeReplace#" },
  ["Rv"]     = { text = "V-REPLACE", hl = "%#SLModeReplace#" },
  ["c"]      = { text = "COMMAND",   hl = "%#SLModeCommand#" },
  ["cv"]     = { text = "EX",        hl = "%#SLModeCommand#" },
  ["ce"]     = { text = "EX",        hl = "%#SLModeCommand#" },
  ["r"]      = { text = "PROMPT",    hl = "%#SLModeCommand#" },
  ["rm"]     = { text = "MORE",      hl = "%#SLModeCommand#" },
  ["r?"]     = { text = "CONFIRM",   hl = "%#SLModeCommand#" },
  ["!"]      = { text = "SHELL",     hl = "%#SLModeTerminal#" },
  ["t"]      = { text = "TERMINAL",  hl = "%#SLModeTerminal#" },
}

function M.statusline()
  local mode_info = mode_map[vim.fn.mode(1)] or { text = vim.fn.mode(1):upper(), hl = "%#SLModeOther#" }
  local mode_str = string.format("%s %s ", mode_info.hl, mode_info.text)

  -- Git branch (非同期キャッシュ)
  local branch = get_git_branch()
  local git_str = ""
  if branch ~= "" then
    git_str = string.format("%%#SLGit#  %s ", branch)
  end

  -- ファイル情報 (相対パス, modified, readonly)
  local file_path = vim.fn.expand("%:~:.")
  if file_path == "" then
    file_path = "[No Name]"
  end
  local modified_str = vim.bo.modified and "%#SLModified#[+]" or ""
  local readonly_str = vim.bo.readonly and "%#SLReadOnly#[RO]" or ""
  local flags = ""
  if modified_str ~= "" or readonly_str ~= "" then
    flags = " " .. modified_str .. readonly_str
  end
  local file_info_str = string.format("%%#SLFile# %s%s ", file_path:gsub("%%", "%%%%"), flags)

  -- LSP Diagnostics (エラー・警告件数)
  local diag_parts = {}
  local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  if err_count > 0 then
    table.insert(diag_parts, string.format("%%#SLDiagError#E:%d", err_count))
  end
  if warn_count > 0 then
    table.insert(diag_parts, string.format("%%#SLDiagWarn#W:%d", warn_count))
  end
  local diag_str = #diag_parts > 0 and (table.concat(diag_parts, " ") .. " ") or ""

  -- 右側情報 (エンコーディング/改行コード, ファイルタイプ, カーソル位置)
  local encoding = vim.bo.fileencoding ~= "" and vim.bo.fileencoding or vim.o.encoding
  local format = vim.bo.fileformat
  local enc_fmt = string.format("%%#SLEncoding#%s[%s] ", encoding, format)
  local filetype = vim.bo.filetype ~= "" and string.format("%%#SLFileType#%s ", vim.bo.filetype) or ""
  local pos_str = "%#SLPos# %l:%c │ %p%% "

  return string.format(
    "%s%%#StatusLine#%s%s%s%%=%s%s%s",
    mode_str,
    git_str,
    file_info_str,
    diag_str,
    enc_fmt,
    filetype,
    pos_str
  )
end

--------------------------------------------------------------------------------
-- 4. Custom Tabline (buflisted buffers + modified mark + diagnostics E/W)
--------------------------------------------------------------------------------
function M.tabline_click(bufnr, _, mouse_button)
  if mouse_button == "l" and bufnr and vim.api.nvim_buf_is_valid(bufnr) then
    vim.api.nvim_set_current_buf(bufnr)
  end
end

function M.tabline()
  local current_buf = vim.api.nvim_get_current_buf()
  local tabs = {}

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
      local is_current = (bufnr == current_buf)

      local base_hl = is_current and "%#TLBufActive#" or "%#TLBufInactive#"
      local mod_hl = is_current and "%#TLModActive#" or "%#TLModInactive#"
      local err_hl = is_current and "%#TLDiagErrorActive#" or "%#TLDiagErrorInactive#"
      local warn_hl = is_current and "%#TLDiagWarnActive#" or "%#TLDiagWarnInactive#"

      local name = vim.api.nvim_buf_get_name(bufnr)
      local filename = (name == "") and "[No Name]" or vim.fn.fnamemodify(name, ":t")
      filename = filename:gsub("%%", "%%%%")

      local mod_str = vim.bo[bufnr].modified and (mod_hl .. " +") or ""

      local diag_parts = {}
      local err_count = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
      local warn_count = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
      if err_count > 0 then
        table.insert(diag_parts, string.format("%sE:%d", err_hl, err_count))
      end
      if warn_count > 0 then
        table.insert(diag_parts, string.format("%sW:%d", warn_hl, warn_count))
      end
      local diag_str = #diag_parts > 0 and (" " .. table.concat(diag_parts, " ")) or ""

      local tab_str = string.format(
        "%%%d@v:lua.require'config.ui'.tabline_click@%s %d: %s%s%s %s%%T",
        bufnr,
        base_hl,
        bufnr,
        filename,
        mod_str,
        diag_str,
        base_hl
      )
      table.insert(tabs, tab_str)
    end
  end

  return table.concat(tabs, "") .. "%#TabLineFill#%="
end

vim.opt.statusline = "%!v:lua.require('config.ui').statusline()"
vim.opt.tabline = "%!v:lua.require('config.ui').tabline()"
vim.opt.showtabline = 2

return M
