<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCProjectSettingsManager

**Extends:** [Node](../Node)

## Description

Registers and allows access to Escoria-specific project settings.

## Constants Descriptions

### AVATARS\_PATH

```gdscript
const AVATARS_PATH: String = "escoria/dialog_simple/avatars_path"
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

### ENABLE\_ROOM\_SELECTOR

```gdscript
const ENABLE_ROOM_SELECTOR: String = "escoria/debug/enable_room_selector"
```

### FAST\_TEXT\_SPEED\_PER\_CHARACTER

```gdscript
const FAST_TEXT_SPEED_PER_CHARACTER: String = "escoria/dialog_simple/fast_text_speed_per_character"
```

### FORCE\_QUIT

```gdscript
const FORCE_QUIT: String = "escoria/main/force_quit"
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

### INVENTORY\_ITEM\_SIZE

```gdscript
const INVENTORY_ITEM_SIZE: String = "escoria/ui/inventory_item_size"
```

### ITEMS\_AUTOREGISTER\_PATH

```gdscript
const ITEMS_AUTOREGISTER_PATH: String = "escoria/ui/items_autoregister_path"
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

### MAX\_TIME\_TO\_DISAPPEAR

```gdscript
const MAX_TIME_TO_DISAPPEAR: String = "escoria/dialog_simple/max_time_to_disappear"
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

### TEXT\_SPEED\_PER\_CHARACTER

```gdscript
const TEXT_SPEED_PER_CHARACTER: String = "escoria/dialog_simple/text_speed_per_character"
```

### TRANSITION\_PATHS

```gdscript
const TRANSITION_PATHS: String = "escoria/ui/transition_paths"
```

### VOICE\_LANG

```gdscript
const VOICE_LANG: String = "escoria/main/voice_lang"
```

## Method Descriptions

### register\_setting

```gdscript
func register_setting(name: String, default, info: Dictionary) -> void
```

Register a new project setting if it hasn't been defined already

#### Parameters

- name: Name of the project setting
- default: Default value
- info: Property info for the setting

### get\_setting

```gdscript
func get_setting(key: String)
```

Retrieves the specified project setting.

#### Parameters

- key: Project setting name.

*Returns* the value of the project setting located with key.

### set\_setting

```gdscript
func set_setting(key: String, value) -> void
```

Sets the specified project setting to the provided value.

#### Parameters

- key: Project setting name.
- value: Project setting value.

### has\_setting

```gdscript
func has_setting(key: String) -> bool
```

Simple wrapper for consistency's sake.

#### Parameters

- key: Project setting name.

*Returns* true iff the project setting exists.