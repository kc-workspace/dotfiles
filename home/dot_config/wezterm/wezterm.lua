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

local patterns = {
  {
    title    = "[PS] {relpath}",
    matches = {
      "^~/Desktop/Personal"
    }
  },
  {
    title    = "[RX] {relpath}",
    matches = {
      "^~/Desktop/Works/Rx"
    }
  },
  {
    title    = "[ST] {relpath}",
    matches = {
      "^~/Desktop/Works/Smartertravel",
      "^~/Desktop/Works/Smartertravel.old"
    }
  },
  {
    title    = "[TMP] {relpath}",
    matches = {
      "^/tmp",
    }
  },
  {
    title    = "{basename}",
    matches = {
      "^/bin",
      "^/usr/bin",
      "^/usr/local/bin",
      "^~/.local/bin"
    }
  }
}

function printf(format, ...)
  wezterm.log_info(string.format(format, ...))
end

function to_title(name, uri, title)
  if uri == nil or uri == "nil" or uri == "" then
    printf('[%s] use default title: %s', name, title)
    return title
  end

  -- Matching logic
  for _, pattern in ipairs(patterns) do
    for _, match in ipairs(pattern.matches) do
      if uri:match(match) ~= nil then
        local suffix = uri:gsub(match, ""):gsub("^/", "")
        local relpath = (suffix == "") and "<root>" or suffix
        local basename = suffix:gsub('(.*[/\\])(.*)', '%2')

        local title = pattern.title
          :gsub("{relpath}", relpath)
          :gsub("{basename}", basename)

        printf('[%s] use pattern title: %s', name, title)
        return title
      end
    end
  end

  printf('[%s] fallback to uri path: %s', name, uri)
  return uri
end

wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
  local uri = tostring(pane.current_working_dir)
  local cwd = uri
    :gsub("^file://", "")
    :gsub(wezterm.home_dir, "~")
    :gsub("^/private", "")
    :gsub("%%(%x%x)", function(hex)
      return string.char(tonumber(hex, 16))
    end)

  return to_title("window", cwd, pane.title)
end)

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local process = pane.foreground_process_name
    :gsub(wezterm.home_dir, "~")
    :gsub("^/private", "")
    :gsub("%%(%x%x)", function(hex)
      return string.char(tonumber(hex, 16))
    end)

  return to_title("tab", process, pane.title)
end)

return config
