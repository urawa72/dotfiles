-- WezTerm設定ファイル
local wezterm = require("wezterm")

-- メイン設定
return {
  -- デフォルトシェル
  default_prog = { "/bin/zsh", "-l" },

  -- フォント設定
  font_size = 14.0,

  -- ウィンドウの外観
  window_background_opacity = 0.9,
  enable_tab_bar = false,

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
  },
}
