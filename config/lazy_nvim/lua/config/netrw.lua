local M = {}

local state = {
  win = nil,
}

vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 4
vim.g.netrw_liststyle = 3

---開いている netrw のフローティングウィンドウを閉じる。
local function close()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    vim.api.nvim_win_close(state.win, true)
  end
  state.win = nil
end

---netrw 標準の <CR> 後、ファイルを開いて netrw から離れたらフロートを閉じる。
---@param win integer
local function close_after_open(win)
  vim.schedule(function()
    if state.win ~= win or not vim.api.nvim_win_is_valid(win) then
      return
    end

    local current_win = vim.api.nvim_get_current_win()
    local current_buf = vim.api.nvim_get_current_buf()
    if current_win ~= win or vim.bo[current_buf].filetype ~= "netrw" then
      close()
    end
  end)
end

---toggle() の表示先になる現在バッファのディレクトリを返す。
---@return string
local function current_dir()
  local dir = vim.fn.expand("%:p:h")
  return dir ~= "" and dir or vim.loop.cwd()
end

---netrw 用の中央配置フローティングウィンドウ設定を作る。
---@return vim.api.keyset.win_config
local function float_opts()
  local width = math.min(math.max(math.floor(vim.o.columns * 0.7), 40), vim.o.columns - 4)
  local height = math.min(math.max(math.floor(vim.o.lines * 0.75), 15), vim.o.lines - 4)

  return {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal",
    border = "rounded",
  }
end

---現在バッファのディレクトリで netrw のフローティングウィンドウを開閉する。
function M.toggle()
  if state.win and vim.api.nvim_win_is_valid(state.win) then
    close()
    return
  end

  local buf = vim.api.nvim_create_buf(false, true)
  state.win = vim.api.nvim_open_win(buf, true, float_opts())
  vim.w[state.win].netrw_float = true
  vim.fn["netrw#LocalBrowseCheck"](current_dir())
end

---フロート内で開いた netrw だけに、閉じるキーと <CR> 後の後始末を設定する。
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function(event)
    if not vim.w.netrw_float then
      return
    end

    vim.keymap.set("n", "q", close, { buffer = event.buf, silent = true })
    vim.keymap.set("n", "<Esc>", close, { buffer = event.buf, silent = true })
    vim.keymap.set("n", "<CR>", function()
      local win = vim.api.nvim_get_current_win()
      local keys = vim.api.nvim_replace_termcodes("<Plug>NetrwLocalBrowseCheck", true, false, true)
      vim.fn.feedkeys(keys, "mx")
      close_after_open(win)
    end, { buffer = event.buf, silent = true })
  end,
})

---フロート外の通常バッファへ移動したら、残っている netrw フロートを閉じる。
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.schedule(function()
      if not state.win or not vim.api.nvim_win_is_valid(state.win) then
        return
      end

      local current_win = vim.api.nvim_get_current_win()
      local current_buf = vim.api.nvim_get_current_buf()
      if current_win ~= state.win and vim.bo[current_buf].filetype ~= "netrw" then
        close()
      end
    end)
  end,
})

return M
