local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.set_environment_variables = {
  PATH = "/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin"
}


config.automatically_reload_config = true

config.window_background_opacity = 0.3
config.macos_window_background_blur = 0

config.default_prog = { "tmux", "new-session", "-A", "-s", "main" }

-- システムベル音を有効化（Claude Codeのタスク完了通知用）
config.audible_bell = "SystemBeep"

-- Shift+Enterで改行を送信
config.keys = {
  {
    key = 'Enter',
    mods = 'SHIFT',
    action = wezterm.action.SendString('\n')
  },
}

return config

