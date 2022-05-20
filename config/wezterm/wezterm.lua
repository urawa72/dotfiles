local wezterm = require 'wezterm';

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  if tab.is_active then
    return {
      {Background={Color="black"}},
      {Text=" " .. tab.active_pane.title .. " "},
    }
  end
  return tab.active_pane.title
end)

wezterm.on("window-config-reloaded", function(window, pane)
  os.execute("echo 'test'")
end)

return {
  font_size = 14.0,
  window_background_opacity = 0.9,
  use_ime = true,
  color_scheme = "Dracula",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  warn_about_missing_glyphs = false,
  keys = {
    { key = "-", mods="CTRL", action="DisableDefaultAssignment" },
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
    { key = "t", mods = "ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
    { key = "j", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
    { key = "k", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
    { key = "w", mods = "ALT", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
  }
}
