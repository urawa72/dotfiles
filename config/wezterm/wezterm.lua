-- WezTerm設定ファイル
local wezterm = require("wezterm")
local mux = wezterm.mux

local session_status = {
  busy = { label = "busy", icon = "●", color = "#50fa7b", order = 2 },
  running = { label = "実行中", icon = "▶", color = "#8be9fd", order = 3 },
  waiting = { label = "待機", icon = "⏸", color = "#f1fa8c", order = 4 },
  needs_attention = { label = "要対応", icon = "⚠", color = "#ff5555", order = 1 },
  idle = { label = "idle", icon = "○", color = "#6272a4", order = 5 },
}

local idle_after_seconds = 5 * 60

local function claude_state_dir()
  local state_home = os.getenv("XDG_STATE_HOME")
  if not state_home or state_home == "" then
    state_home = wezterm.home_dir .. "/.local/state"
  end
  return state_home .. "/claude-sessions"
end

local function cwd_name(cwd)
  local name = cwd:gsub("/+$", ""):match("([^/]+)$")
  return name or cwd
end

local function process_is_dead(session)
  local pid = tonumber(session.pid)
  if not pid or pid <= 0 then
    return false
  end
  local ok, process = pcall(wezterm.procinfo.get_info_for_pid, pid)
  return ok and (process == nil or process.status == "Dead" or process.status == "Zombie")
end

local function display_status(session)
  if session.status == "busy" then
    return "busy"
  end
  local updated_at_epoch = tonumber(session.updated_at_epoch) or 0
  if os.time() - updated_at_epoch >= idle_after_seconds then
    return "idle"
  end
  return session.status
end

local function claude_sessions()
  local sessions = {}
  local subagent_counts = {}
  local ok, paths = pcall(wezterm.glob, claude_state_dir() .. "/*.json")
  if not ok then
    return sessions
  end

  for _, path in ipairs(paths) do
    local read_ok, contents = pcall(wezterm.read_file, path)
    if read_ok then
      local parse_ok, session = pcall(wezterm.json_parse, contents)
      if parse_ok and type(session) == "table" and session_status[session.status] and type(session.cwd) == "string" then
        if process_is_dead(session) then
          os.remove(path)
        elseif session.kind == "subagent" and type(session.parent_session_id) == "string" then
          subagent_counts[session.parent_session_id] = (subagent_counts[session.parent_session_id] or 0) + 1
        elseif session.kind == nil or session.kind == "session" then
          session.display_status = display_status(session)
          table.insert(sessions, session)
        end
      end
    end
  end

  table.sort(sessions, function(a, b)
    local a_order = session_status[a.display_status].order
    local b_order = session_status[b.display_status].order
    if a_order == b_order then
      return a.cwd < b.cwd
    end
    return a_order < b_order
  end)
  for _, session in ipairs(sessions) do
    session.subagent_count = subagent_counts[session.session_id] or 0
  end
  return sessions
end

local function open_claude_sessions(window, pane)
  local choices = {}
  for _, session in ipairs(claude_sessions()) do
    local pane_id = tonumber(session.wezterm_pane)
    local pane_ok, target_pane = pane_id and pcall(mux.get_pane, pane_id)
    if pane_ok and target_pane then
      local status = session_status[session.display_status]
      local subagents = session.subagent_count > 0 and string.format(" +%d", session.subagent_count) or ""
      table.insert(choices, {
        id = tostring(pane_id),
        label = string.format("%s %s  [%s]  pane:%d%s", status.icon, cwd_name(session.cwd), status.label, pane_id, subagents),
      })
    end
  end

  if #choices == 0 then
    window:toast_notification("Claude sessions", "移動可能な Claude Code セッションはありません", 4000)
    return
  end

  window:perform_action(wezterm.action.InputSelector {
    title = "Claude Code sessions",
    fuzzy = true,
    fuzzy_description = "セッションを絞り込み: ",
    choices = choices,
    action = wezterm.action_callback(function(inner_window, _, id)
      if not id then
        return
      end
      local pane_ok, target_pane = pcall(mux.get_pane, tonumber(id))
      if not pane_ok or not target_pane then
        inner_window:toast_notification("Claude sessions", "選択したセッションのペインは既に閉じています", 4000)
        return
      end
      target_pane:activate()
      local target_window = target_pane:window()
      local gui_window = target_window and target_window:gui_window()
      if gui_window then
        gui_window:focus()
      end
    end),
  }, pane)
end

local function cycle_pane(direction)
  return wezterm.action_callback(function(window, pane)
    local tab = window:active_tab()
    if not tab then
      return
    end
    local panes = tab:panes_with_info()
    if #panes <= 1 then
      return
    end

    local current_idx = nil
    for idx, p in ipairs(panes) do
      if p.is_active then
        current_idx = idx
        break
      end
    end

    if not current_idx then
      return
    end

    local target_idx
    if direction == "prev" or direction == -1 or direction == "Prev" then
      target_idx = current_idx == 1 and #panes or (current_idx - 1)
    else
      target_idx = current_idx == #panes and 1 or (current_idx + 1)
    end

    panes[target_idx].pane:activate()
  end)
end

wezterm.on("update-status", function(window)
  local elements = {}
  for index, session in ipairs(claude_sessions()) do
    local status = session_status[session.display_status]
    if index > 1 then
      table.insert(elements, { Foreground = { Color = "#6272a4" } })
      table.insert(elements, { Text = "  |  " })
    end
    table.insert(elements, { Foreground = { Color = status.color } })
    table.insert(elements, { Attribute = { Intensity = "Bold" } })
    table.insert(elements, { Text = string.format("%s %s %s", status.icon, cwd_name(session.cwd), status.label) })
    table.insert(elements, { Attribute = { Intensity = "Normal" } })
    if session.subagent_count > 0 then
      table.insert(elements, { Foreground = { Color = "#bd93f9" } })
      table.insert(elements, { Text = string.format(" +%d", session.subagent_count) })
    end
  end
  window:set_right_status(wezterm.format(elements))
end)

-- メイン設定
local config = {
  -- デフォルトシェル
  default_prog = { "/bin/zsh", "-l" },

  -- フォント設定
  font_size = 14.0,

  -- macOS Optionキーの合成文字入力を無効化（Altキーとして動作させる）
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,

  -- ウィンドウの外観
  window_background_opacity = 0.9,
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,
  status_update_interval = 1000,

  -- 日本語入力サポート
  use_ime = true,

  -- カラースキーム
  color_scheme = "Dracula",

  -- ウィンドウの動作
  adjust_window_size_when_changing_font_size = false,
  warn_about_missing_glyphs = false,

  -- カスタムキーバインド
  keys = {
    -- Ctrl+-とCtrl+dのデフォルト割り当てを無効化
    { key = "-", mods = "CTRL",       action = "DisableDefaultAssignment" },
    { key = "d", mods = "CTRL",       action = "DisableDefaultAssignment" },

    -- Ctrl+Shift+c/vでコピー/ペースト
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },

    -- Claude Code セッションを fuzzy 検索して対象ペインへ移動
    { key = "K", mods = "CTRL|SHIFT", action = wezterm.action_callback(open_claude_sessions) },

    -- ペイン操作 (Alt)
    { key = "v", mods = "ALT",        action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
    { key = "h", mods = "ALT",        action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
    { key = "j", mods = "ALT",        action = cycle_pane("next") },
    { key = "k", mods = "ALT",        action = cycle_pane("prev") },
    { key = "w", mods = "ALT",        action = wezterm.action.CloseCurrentPane { confirm = false } },

    -- タブ操作 (Alt + Shift)
    { key = "j", mods = "ALT|SHIFT",  action = wezterm.action.ActivateTabRelative(1) },
    { key = "k", mods = "ALT|SHIFT",  action = wezterm.action.ActivateTabRelative(-1) },
    { key = "t", mods = "ALT|SHIFT",  action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "w", mods = "ALT|SHIFT",  action = wezterm.action.CloseCurrentTab { confirm = false } },
  },
}

return config
