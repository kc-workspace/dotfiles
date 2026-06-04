# shortkeyutil

Use shortkeyutil to manage macOS symbolic hotkeys from preferences data.

Expected write pattern:

```shell
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add <id> <xml>
```

Apply changes immediately:

```shell
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
```

## Preferences Data Shape

Based on [home/.chezmoidata/preferences.machine.yaml](../home/.chezmoidata/preferences.machine.yaml), one entry looks like:

```yaml
- command: shortkeyutil
  settings:
    - key: 60
      enabled: true
      type: standard
      parameters: [32, 49, 262144]
```

Notes:

- key: required, Apple symbolic hotkey ID.
- enabled: required boolean.
- type: optional. Default is standard when omitted.
- parameters: optional.
- If type and parameters are omitted, only enabled is written.

Minimal valid example:

```yaml
- key: 16
  enabled: false
```

## Current Comparison Table

This table compares known shortcut IDs with your current defaults output.

| ID | Default shortcut | Function | Is enabled |
|---:|---|---|---|
| 7 | Fn + Control + F2 | Move focus to menu bar | true |
| 8 | Fn + Control + F3 | Move focus to Dock | true |
| 9 | Fn + Control + F4 | Move focus to active or next window | true |
| 10 | Fn + Control + F5 | Move focus to window toolbar | true |
| 11 | Fn + Control + F6 | Move focus to floating window | true |
| 12 | Fn + Control + F1 | Full keyboard access toggle | true |
| 13 | Fn + Control + F7 | Change Tab focus behavior | true |
| 15 | Command + Option + 8 | Toggle Zoom | false |
| 17 | Command + Option + = | Zoom in | false |
| 19 | Command + Option + - | Zoom out | false |
| 21 | Command + Control + Option + 8 | Invert colors | false |
| 23 | Command + Option + \\ | Toggle image smoothing | false |
| 25 | Command + Control + Option + . | Increase contrast | false |
| 26 | Command + Control + Option + , | Decrease contrast | false |
| 27 | Command + ` | Move focus to next window in app | true |
| 28 | Command + Shift + 3 | Save screenshot of screen | true |
| 29 | Command + Shift + Control + 3 | Copy screenshot of screen | true |
| 30 | Command + Shift + 4 | Save screenshot of selection | true |
| 31 | Command + Shift + Control + 4 | Copy screenshot of selection | true |
| 32 | Fn + Control + Up | Mission Control / All windows | true |
| 33 | Fn + Control + Down | App windows | true |
| 34 | Fn + Control + Shift + Up | Mission Control (slow) | true |
| 35 | Fn + Control + Shift + Down | App windows (slow) | true |
| 36 | Fn + F11 | Show Desktop | true |
| 37 | Fn + Shift + F11 | Show Desktop (slow) | true |
| 52 | Command + Option + D | Toggle Dock hide/show | true |
| 57 | Fn + Control + F8 | Move focus to status menus | true |
| 59 | Fn + Command + F5 | Toggle VoiceOver | true |
| 60 | Control + Space | Select previous input source | true |
| 61 | Control + Option + Space | Select next input source | true |
| 64 | Command + Space | Spotlight search field | true |
| 65 | Command + Option + Space | Spotlight/Finder search (variant) | true |
| 79 | Fn + Control + Left | Move left a Space | true |
| 80 | Fn + Control + Shift + Left | Move left a Space (slow) | true |
| 81 | Fn + Control + Right | Move right a Space | true |
| 82 | Fn + Control + Shift + Right | Move right a Space (slow) | true |
| 118 | Control + 1 | Switch to Desktop 1 | true |
| 119 | Control + 2 | Switch to Desktop 2 | true |
| 120 | Control + 3 | Switch to Desktop 3 | true |
| 121 | Control + 4 | Switch to Desktop 4 | true |
| 122 | Control + 5 | Switch to Desktop 5 | true |
| 164 | modifier payload | Fn/Globe modifier action | true |
| 176 | SAE1.0 payload | Special/undocumented | true |
| 260 | Command + Esc | Legacy/system action | true |

## Keyboard Shortcuts Style Sections

### Keyboard Navigation

| ID | Default shortcut | Function | Is enabled |
|---:|---|---|---|
| 7 | Fn + Control + F2 | Focus menu bar | true |
| 8 | Fn + Control + F3 | Focus Dock | true |
| 9 | Fn + Control + F4 | Focus active or next window | true |
| 10 | Fn + Control + F5 | Focus window toolbar | true |
| 11 | Fn + Control + F6 | Focus floating window | true |
| 12 | Fn + Control + F1 | Full keyboard access toggle | true |
| 13 | Fn + Control + F7 | Tab behavior toggle | true |
| 27 | Command + ` | Next window in app | true |
| 57 | Fn + Control + F8 | Focus status menus | true |

### Mission Control And Spaces

| ID | Default shortcut | Function | Is enabled |
|---:|---|---|---|
| 32 | Fn + Control + Up | Mission Control | true |
| 33 | Fn + Control + Down | App windows | true |
| 34 | Fn + Control + Shift + Up | Mission Control (slow) | true |
| 35 | Fn + Control + Shift + Down | App windows (slow) | true |
| 36 | Fn + F11 | Show Desktop | true |
| 37 | Fn + Shift + F11 | Show Desktop (slow) | true |
| 79 | Fn + Control + Left | Move left a Space | true |
| 81 | Fn + Control + Right | Move right a Space | true |
| 118 | Control + 1 | Switch to Desktop 1 | true |
| 119 | Control + 2 | Switch to Desktop 2 | true |
| 120 | Control + 3 | Switch to Desktop 3 | true |
| 121 | Control + 4 | Switch to Desktop 4 | true |
| 122 | Control + 5 | Switch to Desktop 5 | true |

### Input Sources

| ID | Default shortcut | Function | Is enabled |
|---:|---|---|---|
| 60 | Control + Space | Previous input source | true |
| 61 | Control + Option + Space | Next input source | true |

### Screenshots

| ID | Default shortcut | Function | Is enabled |
|---:|---|---|---|
| 28 | Command + Shift + 3 | Save screenshot of screen | true |
| 29 | Command + Shift + Control + 3 | Copy screenshot of screen | true |
| 30 | Command + Shift + 4 | Save screenshot of selection | true |
| 31 | Command + Shift + Control + 4 | Copy screenshot of selection | true |

### Accessibility

| ID | Default shortcut | Function | Is enabled |
|---:|---|---|---|
| 15 | Command + Option + 8 | Toggle Zoom | false |
| 17 | Command + Option + = | Zoom in | false |
| 19 | Command + Option + - | Zoom out | false |
| 21 | Command + Control + Option + 8 | Invert colors | false |
| 23 | Command + Option + \\ | Toggle image smoothing | false |
| 25 | Command + Control + Option + . | Increase contrast | false |
| 26 | Command + Control + Option + , | Decrease contrast | false |
| 59 | Fn + Command + F5 | Toggle VoiceOver | true |

### Spotlight And System

| ID | Default shortcut | Function | Is enabled |
|---:|---|---|---|
| 52 | Command + Option + D | Toggle Dock hide/show | true |
| 64 | Command + Space | Spotlight search field | true |
| 65 | Command + Option + Space | Spotlight/Finder search (variant) | true |
| 260 | Command + Esc | Legacy/system action | true |

## Full Observed IDs From Current Defaults

All IDs currently present:

7, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 52, 53, 54, 55, 56, 57, 59, 60, 61, 64, 65, 79, 80, 81, 82, 118, 119, 120, 121, 122, 159, 160, 162, 163, 164, 175, 176, 179, 181, 182, 184, 190, 215, 216, 217, 218, 219, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 235, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 256, 257, 258, 260

IDs that are mostly internal/undocumented on modern macOS and currently present:

53, 54, 55, 56, 159, 160, 162, 163, 175, 176, 179, 181, 182, 184, 190, 215-219, 222-233, 235, 237-251, 256-258

## Common Key Table

| Key name | ASCII code | Physical key number |
|---|---:|---:|
| Space | 32 | 49 |
| Backtick (`) | 96 | 50 |
| 1 | 49 | 18 |
| 2 | 50 | 19 |
| 3 | 51 | 20 |
| 4 | 52 | 21 |
| 5 | 53 | 23 |
| = | 61 | 24 |
| - | 45 | 27 |
| 8 | 56 | 28 |
| / | 47 | 44 |
| , | 44 | 43 |
| . | 46 | 47 |
| \\ | 92 | 42 |
| D | 100 | 2 |
| F | 102 | 3 |
| C | 99 | 8 |
| R | 114 | 15 |
| M | 109 | 46 |
| Left Arrow | 65535 | 123 |
| Right Arrow | 65535 | 124 |
| Down Arrow | 65535 | 125 |
| Up Arrow | 65535 | 126 |
| F1 | 65535 | 122 |
| F2 | 65535 | 120 |
| F3 | 65535 | 99 |
| F4 | 65535 | 118 |
| F5 | 65535 | 96 |
| F6 | 65535 | 97 |
| F7 | 65535 | 98 |
| F8 | 65535 | 100 |
| F9 | 65535 | 101 |
| F11 | 65535 | 103 |
| F14 | 65535 | 107 |
| F15 | 65535 | 113 |
| Esc | 65535 | 53 |
| Return | 65535 | 36 |

## Modifier Bitwise Flags

Base flags:

| Modifier | Value |
|---|---:|
| Shift | 131072 |
| Control | 262144 |
| Option | 524288 |
| Command | 1048576 |
| Fn/Globe | 8388608 |

Observed combined values in your defaults:

| Bitwise value | Meaning |
|---:|---|
| 262144 | Control |
| 786432 | Control + Option |
| 1048576 | Command |
| 1179648 | Command + Shift |
| 1441792 | Command + Shift + Control |
| 1572864 | Command + Option |
| 1835008 | Command + Option + Control |
| 8388608 | Fn/Globe |
| 8519680 | Fn/Globe + Shift |
| 8650752 | Fn/Globe + Control |
| 8781824 | Fn/Globe + Control + Shift |
| 8912896 | Fn/Globe + Option |
| 9437184 | Fn/Globe + Command |
| 9961472 | Fn/Globe + Command + Control |

Examples:

- Command + Option = 1048576 + 524288 = 1572864
- Fn/Globe + Control = 8388608 + 262144 = 8650752
- Fn/Globe + Control + Shift = 8388608 + 262144 + 131072 = 8781824

Special cases:

- key 164 (type modifier) uses parameters [262144, 4294705151] where the second value is opaque.
- key 176 (type SAE1.0) uses parameters [32, 54, 1048592] and does not follow standard bitwise composition.

## Use Cases

### Use case name
Desktop quick switch (Control + number)

### Use case description
Fast navigation across multiple desktops/spaces while coding.

### Data YAML config + description

```yaml
- key: 118
  enabled: true
  type: standard
  parameters: [65535, 18, 262144] # Control + 1
- key: 119
  enabled: true
  type: standard
  parameters: [65535, 19, 262144] # Control + 2
- key: 120
  enabled: true
  type: standard
  parameters: [65535, 20, 262144] # Control + 3
- key: 121
  enabled: true
  type: standard
  parameters: [65535, 21, 262144] # Control + 4
```

### Use case name
Bilingual input switching

### Use case description
Reliable language switching with one hand, suitable for Thai/English workflows.

### Data YAML config + description

```yaml
- key: 60
  enabled: true
  type: standard
  parameters: [32, 49, 262144] # Control + Space
- key: 61
  enabled: true
  type: standard
  parameters: [32, 49, 786432] # Control + Option + Space
```

### Use case name
Screenshot-heavy workflow

### Use case description
Keep both save-to-file and copy-to-clipboard shortcuts enabled for docs and bug reports.

### Data YAML config + description

```yaml
- key: 28
  enabled: true
  type: standard
  parameters: [51, 20, 1179648] # Command + Shift + 3
- key: 29
  enabled: true
  type: standard
  parameters: [51, 20, 1441792] # Command + Shift + Control + 3
- key: 30
  enabled: true
  type: standard
  parameters: [52, 21, 1179648] # Command + Shift + 4
- key: 31
  enabled: true
  type: standard
  parameters: [52, 21, 1441792] # Command + Shift + Control + 4
```

### Use case name
Minimal setup to disable a shortcut

### Use case description
Only key and enabled are required. type and parameters are optional when you only want to turn an ID on or off.

### Data YAML config + description

```yaml
- key: 16
  enabled: false
```

## Validation Commands

```shell
defaults read com.apple.symbolichotkeys AppleSymbolicHotKeys
```

```shell
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
```

## Cautions

- Symbolic hotkey behavior can change between macOS versions.
- Some IDs are internal/legacy and not visible in System Settings.
- SAE1.0 and modifier payloads can contain opaque values.
- type and parameters should be treated as optional in preferences parsing.
