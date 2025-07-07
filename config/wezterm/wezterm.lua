-- WezTerm設定ファイル
local wezterm = require("wezterm")

local M = {}

-- ファイルパスからベース名を抽出する関数
function M.basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

-- タブタイトルのカスタムフォーマッター
-- タブインデックス + カスタムタイトル or プロセス名 or ディレクトリ名を表示
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  -- ユーザー変数でカスタムタイトルが設定されている場合はそれを使用
  local user_title = tab.active_pane.user_vars.panetitle
  if user_title ~= nil and #user_title > 0 then
    return {
      { Text = tab.tab_index + 1 .. ":" .. user_title },
    }
  end

  -- プロセス名が利用可能な場合はそれを使用
  local title = wezterm.truncate_right(M.basename(tab.active_pane.foreground_process_name), max_width)
  if title == "" then
    -- フォールバックとしてディレクトリ名を使用
    local dir = string.gsub(tab.active_pane.title, "(.*[: ])(.*)", "%2")
    title = wezterm.truncate_right(dir, max_width)
  end
  return {
    { Text = tab.tab_index + 1 .. ":" .. title },
  }
end)

-- メイン設定
return {
  -- デフォルトシェル
  default_prog = { "/bin/zsh", "-l" },

  -- フォント設定
  font_size = 14.0,

  -- ウィンドウの外観
  window_background_opacity = 0.9,

  -- 日本語入力サポート
  use_ime = true,

  -- カラースキーム
  color_scheme = "Dracula",

  -- ウィンドウの動作
  adjust_window_size_when_changing_font_size = false,
  warn_about_missing_glyphs = false,

  -- カスタムキーバインド
  keys = {
    -- Alt+h: ペインを水平分割
    { key = "h", mods = "ALT",        action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },

    -- Ctrl+-とCtrl+dのデフォルト割り当てを無効化
    { key = "-", mods = "CTRL",       action = "DisableDefaultAssignment" },
    { key = "d", mods = "CTRL",       action = "DisableDefaultAssignment" },

    -- Ctrl+Shift+c/vでコピー/ペースト
    { key = "c", mods = "CTRL|SHIFT", action = wezterm.action({ CopyTo = "Clipboard" }) },
    { key = "v", mods = "CTRL|SHIFT", action = wezterm.action({ PasteFrom = "Clipboard" }) },

    -- Alt+t: 新しいタブを作成
    { key = "t", mods = "ALT",        action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },

    -- Alt+j/k: タブ間を移動
    { key = "j", mods = "ALT",        action = wezterm.action({ ActivateTabRelative = -1 }) },
    { key = "k", mods = "ALT",        action = wezterm.action({ ActivateTabRelative = 1 }) },

    -- Alt+q: 確認なしで現在のペインを閉じる
    { key = "q", mods = "ALT",        action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
  },
}
