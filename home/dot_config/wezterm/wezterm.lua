local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'OneDark (base16)'
config.exit_behavior = 'Close'
config.exit_behavior_messaging = 'Brief'
config.font = wezterm.font('JetBrains Mono')
config.font_size = 17
config.hyperlink_rules = wezterm.default_hyperlink_rules()
config.line_height = 1.1
config.macos_window_background_blur = 30
config.notification_handling = 'AlwaysShow'
config.scrollback_lines = 10000
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false
config.use_dead_keys = false
config.use_ime = true
config.window_background_opacity = 0.95
config.window_decorations = 'INTEGRATED_BUTTONS | RESIZE'

config.keys = {
  {
    key = 'P',
    mods = 'SUPER | SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
}

-- Events --

local title_patterns = {
  {
    title    = "[PS] {relpath}",
    prefixes = {
      "~/Desktop/Personal"
    }
  },
  {
    title    = "[RX] {relpath}",
    prefixes = {
      "~/Desktop/Works/Rx"
    }
  },
  {
    title    = "[ST] {relpath}",
    prefixes = {
      "~/Desktop/Works/Smartertravel",
      "~/Desktop/Works/Smartertravel.old"
    }
  },
  {
    title    = "[TMP] {relpath}",
    prefixes = {
      "/tmp",
    }
  }
}

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local uri = tostring(tab.active_pane.current_working_dir)

  if uri == "nil" then
    wezterm.log_info('Use pane title: ' .. tab.active_pane.title)
    return tab.active_pane.title
  end

  local home = os.getenv("HOME")
  local cwd = uri
    :gsub("^file://", "")
    :gsub(home, "~")
    :gsub("^/private", "")
    :gsub("%%(%x%x)", function(hex)
      return string.char(tonumber(hex, 16))
    end)

  -- Matching logic
  for _, group in ipairs(title_patterns) do
    for _, prefix in ipairs(group.prefixes) do
      if cwd:sub(1, #prefix) == prefix then
        local suffix = cwd:sub(#prefix + 2) -- remove / prefix
        local relpath = (suffix == "") and "<root>" or suffix
        wezterm.log_info('Use title template: ' .. group.title)
        return group.title:gsub("{relpath}", relpath)
      end
    end
  end

  wezterm.log_info('Use cwd title: ' .. cwd)
  return cwd
end)

return config
