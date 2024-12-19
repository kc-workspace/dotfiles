local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'OneDark (base16)'
config.exit_behavior = 'CloseOnCleanExit'
config.exit_behavior_messaging = 'Brief'
config.font = wezterm.font('JetBrains Mono')
config.font_size = 17
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.line_height = 1.1
config.macos_window_background_blur = 10
config.notification_handling = 'AlwaysShow'
config.scrollback_lines = 10000
config.use_dead_keys = false
config.window_background_opacity = 0.85
config.window_decorations = 'INTEGRATED_BUTTONS | RESIZE'

config.keys = {
  {
    key = 'P',
    mods = 'SUPER | SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
}

return config
