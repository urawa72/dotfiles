local M = {}

local status_labels = {
  running = "実行中",
  busy = "実行中",
  waiting = "待機中",
  needs_attention = "要対応",
}

local status_order = {
  needs_attention = 1,
  busy = 2,
  running = 3,
  waiting = 4,
}

local function state_dir()
  local root = vim.env.XDG_STATE_HOME
  if not root or root == "" then
    root = vim.fn.expand("~/.local/state")
  end
  return root .. "/claude-sessions"
end

local function sessions()
  local entries = {}
  local handle = vim.uv.fs_scandir(state_dir())
  if not handle then
    return entries
  end

  while true do
    local name, kind = vim.uv.fs_scandir_next(handle)
    if not name then
      break
    end
    if kind == "file" and name:sub(-5) == ".json" then
      local path = state_dir() .. "/" .. name
      local ok, decoded = pcall(vim.json.decode, table.concat(vim.fn.readfile(path), "\n"))
      if ok
        and type(decoded) == "table"
        and status_labels[decoded.status]
        and type(decoded.session_id) == "string"
        and type(decoded.cwd) == "string"
      then
        table.insert(entries, decoded)
      end
    end
  end

  table.sort(entries, function(a, b)
    local order_a = status_order[a.status] or math.huge
    local order_b = status_order[b.status] or math.huge
    if order_a == order_b then
      return (a.updated_at or "") > (b.updated_at or "")
    end
    return order_a < order_b
  end)
  return entries
end

function M.pick()
  local fzf = require("fzf-lua")
  local choices = {}
  local by_choice = {}

  for _, session in ipairs(sessions()) do
    local choice = string.format(
      "[%-4s] %-10s %s  (%s)",
      status_labels[session.status],
      session.session_id:sub(1, 8),
      session.cwd,
      session.updated_at or ""
    )
    table.insert(choices, choice)
    by_choice[choice] = session
  end

  if #choices == 0 then
    vim.notify("アクティブな Claude Code セッションはありません", vim.log.levels.INFO)
    return
  end

  fzf.fzf_exec(choices, {
    prompt = "Claude sessions> ",
    actions = {
      ["default"] = function(selected)
        local session = by_choice[selected[1]]
        if session then
          vim.cmd("cd " .. vim.fn.fnameescape(session.cwd))
          vim.notify("cwd: " .. session.cwd)
        end
      end,
      ["ctrl-r"] = function(selected)
        local session = by_choice[selected[1]]
        if session then
          vim.cmd("botright 15split | terminal claude --resume " .. vim.fn.shellescape(session.session_id))
          vim.cmd("startinsert")
        end
      end,
      ["ctrl-y"] = function(selected)
        local session = by_choice[selected[1]]
        if session then
          vim.fn.setreg("+", session.session_id)
          vim.notify("Claude session ID をクリップボードへコピーしました")
        end
      end,
    },
  })
end

return M
