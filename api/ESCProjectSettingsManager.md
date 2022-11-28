<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCProjectSettingsManager

**Extends:** [Resource](../Resource)

## Description

Registers and allows access to Escoria-specific project settings.

## Constants Descriptions

### ACTION\_DEFAULT\_SCRIPT

```gdscript
const ACTION_DEFAULT_SCRIPT: String = "escoria/main/action_default_script"
```

### COMMAND\_DIRECTORIES

```gdscript
const COMMAND_DIRECTORIES: String = "escoria/main/command_directories"
```

### CRASH\_MESSAGE

```gdscript
const CRASH_MESSAGE: String = "escoria/debug/crash_message"
```

### DEFAULT\_DIALOG\_TYPE

```gdscript
const DEFAULT_DIALOG_TYPE: String = "escoria/ui/default_dialog_type"
```

### DEFAULT\_TRANSITION

```gdscript
const DEFAULT_TRANSITION: String = "escoria/ui/default_transition"
```

### DEVELOPMENT\_LANG

```gdscript
const DEVELOPMENT_LANG: String = "escoria/debug/development_lang"
```

### DIALOG\_MANAGERS

```gdscript
const DIALOG_MANAGERS: String = "escoria/ui/dialog_managers"
```

### DISPLAY

```gdscript
const DISPLAY: String = "display"
```

Godot Windows project settings

### ENABLE\_ROOM\_SELECTOR

```gdscript
const ENABLE_ROOM_SELECTOR: String = "escoria/debug/enable_room_selector"
```

### FORCE\_QUIT

```gdscript
const FORCE_QUIT: String = "escoria/main/force_quit"
```

### FULLSCREEN

```gdscript
const FULLSCREEN: String = "display/window/size/fullscreen"
```

### GAME\_MIGRATION\_PATH

```gdscript
const GAME_MIGRATION_PATH: String = "escoria/main/game_migration_path"
```

### GAME\_SCENE

```gdscript
const GAME_SCENE: String = "escoria/ui/game_scene"
```

### GAME\_START\_SCRIPT

```gdscript
const GAME_START_SCRIPT: String = "escoria/main/game_start_script"
```

### GAME\_VERSION

```gdscript
const GAME_VERSION: String = "escoria/main/game_version"
```

### INVENTORY\_ITEMS\_PATH

```gdscript
const INVENTORY_ITEMS_PATH: String = "escoria/ui/inventory_items_path"
```

### INVENTORY\_ITEM\_SIZE

```gdscript
const INVENTORY_ITEM_SIZE: String = "escoria/ui/inventory_item_size"
```

### LOG\_FILE\_PATH

```gdscript
const LOG_FILE_PATH: String = "escoria/debug/log_file_path"
```

### LOG\_LEVEL

```gdscript
const LOG_LEVEL: String = "escoria/debug/log_level"
```

### MASTER\_VOLUME

```gdscript
const MASTER_VOLUME: String = "escoria/sound/master_volume"
```

### MUSIC\_VOLUME

```gdscript
const MUSIC_VOLUME: String = "escoria/sound/music_volume"
```

### ROOM\_SELECTOR\_ROOM\_DIR

```gdscript
const ROOM_SELECTOR_ROOM_DIR: String = "escoria/debug/room_selector_room_dir"
```

### SAVEGAMES\_PATH

```gdscript
const SAVEGAMES_PATH: String = "escoria/main/savegames_path"
```

### SETTINGS\_PATH

```gdscript
const SETTINGS_PATH: String = "escoria/main/settings_path"
```

### SFX\_VOLUME

```gdscript
const SFX_VOLUME: String = "escoria/sound/sfx_volume"
```

### SIZE

```gdscript
const SIZE: String = "size"
```

### SKIP\_CACHE

```gdscript
const SKIP_CACHE: String = "escoria/platform/skip_cache"
```

### SKIP\_CACHE\_MOBILE

```gdscript
const SKIP_CACHE_MOBILE: String = "escoria/platform/skip_cache.mobile"
```

### SPEECH\_ENABLED

```gdscript
const SPEECH_ENABLED: String = "escoria/sound/speech_enabled"
```

### SPEECH\_EXTENSION

```gdscript
const SPEECH_EXTENSION: String = "escoria/sound/speech_extension"
```

### SPEECH\_FOLDER

```gdscript
const SPEECH_FOLDER: String = "escoria/sound/speech_folder"
```

### SPEECH\_VOLUME

```gdscript
const SPEECH_VOLUME: String = "escoria/sound/speech_volume"
```

### TERMINATE\_ON\_ERRORS

```gdscript
const TERMINATE_ON_ERRORS: String = "escoria/debug/terminate_on_errors"
```

### TERMINATE\_ON\_WARNINGS

```gdscript
const TERMINATE_ON_WARNINGS: String = "escoria/debug/terminate_on_warnings"
```

### TEXT\_LANG

```gdscript
const TEXT_LANG: String = "escoria/main/text_lang"
```

### TRANSITION\_PATHS

```gdscript
const TRANSITION_PATHS: String = "escoria/ui/transition_paths"
```

### VOICE\_LANG

```gdscript
const VOICE_LANG: String = "escoria/main/voice_lang"
```

### WINDOW

```gdscript
const WINDOW: String = "window"
```

## Method Descriptions

### register\_setting <small>(static)</small>

```gdscript
func register_setting(name: String, default_value, info: Dictionary) -> void
```

Register a new project setting if it hasn't been defined already

#### Parameters

- name: Name of the project setting
- default_value: Default value
- info: Property info for the setting

### remove\_setting <small>(static)</small>

```gdscript
func remove_setting(name: String) -> void
```

Removes the specified project setting.

#### Parameters

- name: Name of the project setting

### get\_setting <small>(static)</small>

```gdscript
func get_setting(key: String)
```

Retrieves the specified project setting.

#### Parameters

- key: Project setting name.

*Returns* the value of the project setting located with key.

### set\_setting <small>(static)</small>

```gdscript
func set_setting(key: String, value) -> void
```

Sets the specified project setting to the provided value.

#### Parameters

- key: Project setting name.
- value: Project setting value.

### has\_setting <small>(static)</small>

```gdscript
func has_setting(key: String) -> bool
```

Simple wrapper for consistency's sake.

#### Parameters

- key: Project setting name.

*Returns* true iff the project setting exists.