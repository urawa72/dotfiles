local wezterm = require("wezterm")

local M = {}

function M.basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, max_width)
  local user_title = tab.active_pane.user_vars.panetitle
  if user_title ~= nil and #user_title > 0 then
    return {
      { Text = tab.tab_index + 1 .. ":" .. user_title },
    }
  end

  local title = wezterm.truncate_right(M.basename(tab.active_pane.foreground_process_name), max_width)
  if title == "" then
    local dir = string.gsub(tab.active_pane.title, "(.*[: ])(.*)", "%2")
    title = wezterm.truncate_right(dir, max_width)
  end
  return {
    { Text = tab.tab_index + 1 .. ":" .. title },
  }
end)

return {
  default_prog = { "/bin/zsh", "-l" },
  font_size = 14.0,
  window_background_opacity = 0.9,
  use_ime = true,
  color_scheme = "Dracula",
  adjust_window_size_when_changing_font_size = false,
  warn_about_missing_glyphs = false,
  keys = {
    { key = "h", mods = "ALT",        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
    { key = "-", mods = "CTRL",       action = "DisableDefaultAssignment" },
    { key = "d", mods = "CTRL",       action = "DisableDefaultAssignment" },
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
    { key = "t", mods = "ALT",        action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "j", mods = "ALT",        action = wezterm.action({ ActivateTabRelative = -1 }) },
    { key = "k", mods = "ALT",        action = wezterm.action({ ActivateTabRelative = 1 }) },
    { key = "q", mods = "ALT",        action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
  },
}
