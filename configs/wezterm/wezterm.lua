local wezterm = require 'wezterm';

return {
	font = wezterm.font("UbuntuMono"),
  font_size = 13.0,
  use_ime = true,
  color_scheme = "iceberg-dark",
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
	warn_about_missing_glyphs = false
}
