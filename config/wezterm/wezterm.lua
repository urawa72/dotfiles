local wezterm = require 'wezterm';

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local title = wezterm.truncate_right(utils.basename(tab.active_pane.foreground_process_name), max_width)
	if title == "" then
		title = wezterm.truncate_right(
			utils.basename(utils.convert_home_dir(tab.active_pane.current_working_dir)),
			max_width
		)
	end
	return {
		{ Text = tab.tab_index + 1 .. ":" .. title },
	}
end)

return {
  font_size = 11.0,
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
		{ key = "q", mods = "ALT", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
	}
}
