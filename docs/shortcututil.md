# shortkeyutil

Use shortkeyutil to manage macOS symbolic hotkeys from preferences data.

- [Preferences Data Shape](#preferences-data-shape)
- [Keyboard Shortcuts Style Sections](#keyboard-shortcuts-style-sections)
  - [Keyboard Navigation](#keyboard-navigation)
  - [Mission Control And Spaces](#mission-control-and-spaces)
  - [Input Sources](#input-sources)
  - [Screenshots](#screenshots)
  - [Accessibility](#accessibility)
  - [Spotlight And System](#spotlight-and-system)
  - [Window Management And Tiling](#window-management-and-tiling)
  - [Display](#display)
- [Common Key Table](#common-key-table)
- [Modifier Bitwise Flags](#modifier-bitwise-flags)
- [Use Cases](#use-cases)
  - [Use case 1: Desktop quick switch](#use-case-1-desktop-quick-switch)
  - [Use case 2: Bilingual input switching](#use-case-2-bilingual-input-switching)
  - [Use case 3: Screenshot-heavy workflow](#use-case-3-screenshot-heavy-workflow)
  - [Use case 4: Minimal setup to disable a shortcut](#use-case-4-minimal-setup-to-disable-a-shortcut)
- [Validation Commands](#validation-commands)
- [Cautions](#cautions)


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

## Keyboard Shortcuts Style Sections

### Keyboard Navigation

|   ID | Default shortcut  | Function                    | Is enabled | Confidence |
| ---: | ----------------- | --------------------------- | ---------- | ---------- |
|    7 | Fn + Control + F2 | Focus menu bar              | true       | high       |
|    8 | Fn + Control + F3 | Focus Dock                  | true       | high       |
|    9 | Fn + Control + F4 | Focus active or next window | true       | high       |
|   10 | Fn + Control + F5 | Focus window toolbar        | true       | high       |
|   11 | Fn + Control + F6 | Focus floating window       | true       | high       |
|   12 | Fn + Control + F1 | Full keyboard access toggle | true       | high       |
|   13 | Fn + Control + F7 | Tab behavior toggle         | true       | high       |
|   27 | Command + `       | Next window in app          | true       | high       |
|   57 | Fn + Control + F8 | Focus status menus          | true       | high       |

### Mission Control And Spaces

|   ID | Default shortcut            | Function               | Is enabled | Confidence |
| ---: | --------------------------- | ---------------------- | ---------- | ---------- |
|   32 | Fn + Control + Up           | Mission Control        | true       | high       |
|   33 | Fn + Control + Down         | App windows            | true       | high       |
|   34 | Fn + Control + Shift + Up   | Mission Control (slow) | true       | high       |
|   35 | Fn + Control + Shift + Down | App windows (slow)     | true       | high       |
|   36 | Fn + F11                    | Show Desktop           | true       | high       |
|   37 | Fn + Shift + F11            | Show Desktop (slow)    | true       | high       |
|   79 | Fn + Control + Left         | Move left a Space      | true       | high       |
|   81 | Fn + Control + Right        | Move right a Space     | true       | high       |
|  118 | Control + 1                 | Switch to Desktop 1    | true       | high       |
|  119 | Control + 2                 | Switch to Desktop 2    | true       | high       |
|  120 | Control + 3                 | Switch to Desktop 3    | true       | high       |
|  121 | Control + 4                 | Switch to Desktop 4    | true       | high       |
|  122 | Control + 5                 | Switch to Desktop 5    | true       | high       |

### Input Sources

|   ID | Default shortcut         | Function              | Is enabled | Confidence |
| ---: | ------------------------ | --------------------- | ---------- | ---------- |
|   60 | Control + Space          | Previous input source | true       | high       |
|   61 | Control + Option + Space | Next input source     | true       | high       |

### Screenshots

|   ID | Default shortcut              | Function                         | Is enabled | Confidence |
| ---: | ----------------------------- | -------------------------------- | ---------- | ---------- |
|   28 | Command + Shift + 3           | Save screenshot of screen        | true       | high       |
|   29 | Command + Shift + Control + 3 | Copy screenshot of screen        | true       | high       |
|   30 | Command + Shift + 4           | Save screenshot of selection     | true       | high       |
|   31 | Command + Shift + Control + 4 | Copy screenshot of selection     | true       | high       |
|  181 | Command + Shift + 6           | Save picture of Touch Bar        | true       | medium     |
|  182 | Command + Shift + Control + 6 | Copy picture of Touch Bar        | true       | medium     |
|  184 | Command + Shift + 5           | Screenshot and recording options | true       | medium     |

### Accessibility

|   ID | Default shortcut               | Function                    | Is enabled | Confidence |
| ---: | ------------------------------ | --------------------------- | ---------- | ---------- |
|   15 | Command + Option + 8           | Toggle Zoom                 | false      | high       |
|   17 | Command + Option + =           | Zoom in                     | false      | high       |
|   19 | Command + Option + -           | Zoom out                    | false      | high       |
|   21 | Command + Control + Option + 8 | Invert colors               | false      | high       |
|   23 | Command + Option + \\          | Toggle image smoothing      | false      | high       |
|   25 | Command + Control + Option + . | Increase contrast           | false      | high       |
|   26 | Command + Control + Option + , | Decrease contrast           | false      | high       |
|   59 | Fn + Command + F5              | Toggle VoiceOver            | true       | high       |
|  162 | Fn + Command + Control + F5    | Accessibility / Zoom action | true       | low        |

### Spotlight And System

|   ID | Default shortcut         | Function                          | Is enabled | Confidence |
| ---: | ------------------------ | --------------------------------- | ---------- | ---------- |
|   52 | Command + Option + D     | Toggle Dock hide/show             | true       | high       |
|   64 | Command + Space          | Spotlight search field            | true       | high       |
|   65 | Command + Option + Space | Spotlight/Finder search (variant) | true       | high       |
|  159 | Control + Return         | Spotlight / menu action           | true       | low        |
|  176 | Command + Space (SAE1.0) | Dictation / special input action  | true       | low        |
|  190 | Fn + Q                   | Focus / Quick action              | true       | low        |
|  260 | Command + Esc            | Legacy/system action              | true       | medium     |

### Window Management And Tiling

|   ID | Default shortcut             | Function                            | Is enabled | Confidence |
| ---: | ---------------------------- | ----------------------------------- | ---------- | ---------- |
|  233 | Command + M                  | Minimize / window action            | true       | medium     |
|  237 | Fn + Control + F             | Window tiling: fill / full          | true       | medium     |
|  238 | Fn + Control + C             | Window tiling: center               | true       | medium     |
|  239 | Fn + Control + R             | Window tiling: return to prev size  | true       | medium     |
|  240 | Fn + Control + Left          | Window tiling: tile left            | true       | medium     |
|  241 | Fn + Control + Right         | Window tiling: tile right           | true       | medium     |
|  242 | Fn + Control + Up            | Window tiling: tile top             | true       | medium     |
|  243 | Fn + Control + Down          | Window tiling: tile bottom          | true       | medium     |
|  248 | Fn + Control + Shift + Left  | Window tiling: top-left quarter     | true       | medium     |
|  249 | Fn + Control + Shift + Right | Window tiling: top-right quarter    | true       | medium     |
|  250 | Fn + Control + Shift + Up    | Window tiling: bottom-left quarter  | true       | medium     |
|  251 | Fn + Control + Shift + Down  | Window tiling: bottom-right quarter | true       | medium     |

Window tiling IDs (`237`-`251`) match the macOS Sequoia Window Tiling set and
overlap with older Mission Control "Move a Space" bindings on some versions.
Unbound placeholder IDs (parameters `[65535, 65535, 0]`, e.g. `215`-`232`,
`244`-`247`, `256`-`258`) are omitted here.

### Display

|   ID | Default shortcut  | Function                             | Is enabled | Confidence |
| ---: | ----------------- | ------------------------------------ | ---------- | ---------- |
|   53 | Fn + F14          | Decrease display brightness (legacy) | true       | high       |
|   54 | Fn + F15          | Increase display brightness (legacy) | true       | high       |
|   55 | Fn + Option + F14 | Display brightness (alt)             | true       | high       |
|   56 | Fn + Option + F15 | Display brightness (alt)             | true       | high       |

## Common Key Table

| Key name     | ASCII code | Physical key number |
| ------------ | ---------: | ------------------: |
| Space        |         32 |                  49 |
| Backtick (`) |         96 |                  50 |
| 1            |         49 |                  18 |
| 2            |         50 |                  19 |
| 3            |         51 |                  20 |
| 4            |         52 |                  21 |
| 5            |         53 |                  23 |
| =            |         61 |                  24 |
| -            |         45 |                  27 |
| 8            |         56 |                  28 |
| /            |         47 |                  44 |
| ,            |         44 |                  43 |
| .            |         46 |                  47 |
| \\           |         92 |                  42 |
| D            |        100 |                   2 |
| F            |        102 |                   3 |
| C            |         99 |                   8 |
| R            |        114 |                  15 |
| M            |        109 |                  46 |
| Left Arrow   |      65535 |                 123 |
| Right Arrow  |      65535 |                 124 |
| Down Arrow   |      65535 |                 125 |
| Up Arrow     |      65535 |                 126 |
| F1           |      65535 |                 122 |
| F2           |      65535 |                 120 |
| F3           |      65535 |                  99 |
| F4           |      65535 |                 118 |
| F5           |      65535 |                  96 |
| F6           |      65535 |                  97 |
| F7           |      65535 |                  98 |
| F8           |      65535 |                 100 |
| F9           |      65535 |                 101 |
| F11          |      65535 |                 103 |
| F14          |      65535 |                 107 |
| F15          |      65535 |                 113 |
| Esc          |      65535 |                  53 |
| Return       |      65535 |                  36 |

## Modifier Bitwise Flags

Base flags:

| Modifier |   Value |
| -------- | ------: |
| Shift    |  131072 |
| Control  |  262144 |
| Option   |  524288 |
| Command  | 1048576 |
| Fn/Globe | 8388608 |

Observed combined values in your defaults:

| Bitwise value | Meaning                      |
| ------------: | ---------------------------- |
|        262144 | Control                      |
|        786432 | Control + Option             |
|       1048576 | Command                      |
|       1179648 | Command + Shift              |
|       1441792 | Command + Shift + Control    |
|       1572864 | Command + Option             |
|       1835008 | Command + Option + Control   |
|       8388608 | Fn/Globe                     |
|       8519680 | Fn/Globe + Shift             |
|       8650752 | Fn/Globe + Control           |
|       8781824 | Fn/Globe + Control + Shift   |
|       8912896 | Fn/Globe + Option            |
|       9437184 | Fn/Globe + Command           |
|       9961472 | Fn/Globe + Command + Control |

Examples:

- Command + Option = 1048576 + 524288 = 1572864
- Fn/Globe + Control = 8388608 + 262144 = 8650752
- Fn/Globe + Control + Shift = 8388608 + 262144 + 131072 = 8781824

Special cases:

- key 164 (type modifier) uses parameters [262144, 4294705151] where the second value is opaque.
- key 176 (type SAE1.0) uses parameters [32, 54, 1048592] and does not follow standard bitwise composition.

## Use Cases

### Use case 1: Desktop quick switch

Fast navigation across multiple desktops/spaces while coding.

```yaml
- key: 118 # Switch to Desktop 1
  enabled: true
  type: standard
  parameters: [65535, 18, 262144] # Control + 1
- key: 119 # Switch to Desktop 2
  enabled: true
  type: standard
  parameters: [65535, 19, 262144] # Control + 2
- key: 120 # Switch to Desktop 3
  enabled: true
  type: standard
  parameters: [65535, 20, 262144] # Control + 3
- key: 121 # Switch to Desktop 4
  enabled: true
  type: standard
  parameters: [65535, 21, 262144] # Control + 4
```

### Use case 2: Bilingual input switching

Reliable language switching with one hand, suitable for Thai/English workflows.

```yaml
- key: 60 # Previous input source
  enabled: true
  type: standard
  parameters: [32, 49, 262144] # Control + Space
- key: 61 # Next input source
  enabled: true
  type: standard
  parameters: [32, 49, 786432] # Control + Option + Space
```

### Use case 3: Screenshot-heavy workflow

Keep both save-to-file and copy-to-clipboard shortcuts enabled for docs and bug reports.

```yaml
- key: 28 # Save screenshot of screen
  enabled: true
  type: standard
  parameters: [51, 20, 1179648] # Command + Shift + 3
- key: 29 # Copy screenshot of screen
  enabled: true
  type: standard
  parameters: [51, 20, 1441792] # Command + Shift + Control + 3
- key: 30 # Save screenshot of selection
  enabled: true
  type: standard
  parameters: [52, 21, 1179648] # Command + Shift + 4
- key: 31 # Copy screenshot of selection
  enabled: true
  type: standard
  parameters: [52, 21, 1441792] # Command + Shift + Control + 4
```

### Use case 4: Minimal setup to disable a shortcut

Only key and enabled are required. type and parameters are optional when you only want to turn an ID on or off.

```yaml
- key: 16 # Disable shortcut
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
