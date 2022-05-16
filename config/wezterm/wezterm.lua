local wezterm = require 'wezterm';

return {
  font_size = 14.0,
	window_background_opacity = 0.8,
  use_ime = true,
  color_scheme = "iceberg-dark",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
	warn_about_missing_glyphs = false,
	keys = {
		{ key="-", mods="CTRL", action="DisableDefaultAssignment" },
		{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
		{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },
		{ key = "t", mods = "ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "j", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
		{ key = "k", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
		{ key = "w", mods = "ALT", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
	}
}
