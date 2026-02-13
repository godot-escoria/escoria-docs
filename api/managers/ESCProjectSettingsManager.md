
  (ESCProjectSettingsManager)=
# ESCProjectSettingsManager

**Extends:** {ref}`Resource <Resource>`
        
## Description

Registers and allows access to Escoria-specific project settings. 



## Constants

### DEFAULT\_DIALOG\_TYPE
```gdscript
const DEFAULT_DIALOG_TYPE = "escoria/ui/default_dialog_type"

```
Path to the default dialog type setting.
### DEFAULT\_TRANSITION
```gdscript
const DEFAULT_TRANSITION = "escoria/ui/default_transition"

```
Path to the default transition setting.
### DIALOG\_MANAGERS
```gdscript
const DIALOG_MANAGERS = "escoria/ui/dialog_managers"

```
Path to the dialog managers setting.
### GAME\_SCENE
```gdscript
const GAME_SCENE = "escoria/ui/game_scene"

```
Path to the game scene setting.
### INVENTORY\_ITEM\_SIZE
```gdscript
const INVENTORY_ITEM_SIZE = "escoria/ui/inventory_item_size"

```
Path to the inventory item size setting.
### INVENTORY\_ITEMS\_PATH
```gdscript
const INVENTORY_ITEMS_PATH = "escoria/ui/inventory_items_path"

```
Path to the inventory items path setting.
### TRANSITION\_PATHS
```gdscript
const TRANSITION_PATHS = "escoria/ui/transition_paths"

```
Path to the transition paths setting.
### COMMAND\_DIRECTORIES
```gdscript
const COMMAND_DIRECTORIES = "escoria/main/command_directories"

```
Path to the command directories setting.
### FORCE\_QUIT
```gdscript
const FORCE_QUIT = "escoria/main/force_quit"

```
Path to the force quit setting.
### GAME\_MIGRATION\_PATH
```gdscript
const GAME_MIGRATION_PATH = "escoria/main/game_migration_path"

```
Path to the game migration path setting.
### GAME\_VERSION
```gdscript
const GAME_VERSION = "escoria/main/game_version"

```
Path to the game version setting.
### GAME\_START\_SCRIPT
```gdscript
const GAME_START_SCRIPT = "escoria/main/game_start_script"

```
Path to the game start script setting.
### ACTION\_DEFAULT\_SCRIPT
```gdscript
const ACTION_DEFAULT_SCRIPT = "escoria/main/action_default_script"

```
Path to the action default script setting.
### SAVEGAMES\_PATH
```gdscript
const SAVEGAMES_PATH = "escoria/main/savegames_path"

```
Path to the savegames path setting.
### SETTINGS\_PATH
```gdscript
const SETTINGS_PATH = "escoria/main/settings_path"

```
Path to the settings path setting.
### TEXT\_LANG
```gdscript
const TEXT_LANG = "escoria/main/text_lang"

```
Path to the text language setting.
### VOICE\_LANG
```gdscript
const VOICE_LANG = "escoria/main/voice_lang"

```
Path to the voice language setting.
### CRASH\_MESSAGE
```gdscript
const CRASH_MESSAGE = "escoria/debug/crash_message"

```
Path to the crash message setting.
### DEVELOPMENT\_LANG
```gdscript
const DEVELOPMENT_LANG = "escoria/debug/development_lang"

```
Path to the development language setting.
### ENABLE\_ROOM\_SELECTOR
```gdscript
const ENABLE_ROOM_SELECTOR = "escoria/debug/enable_room_selector"

```
If enabled, displays the room selection box for quick room change
### LOG\_FILE\_PATH
```gdscript
const LOG_FILE_PATH = "escoria/debug/log_file_path"

```
Path to the log file path setting.
### LOG\_LEVEL
```gdscript
const LOG_LEVEL = "escoria/debug/log_level"

```
Path to the log level setting.
### ROOM\_SELECTOR\_ROOM\_DIR
```gdscript
const ROOM_SELECTOR_ROOM_DIR = "escoria/debug/room_selector_room_dir"

```
Path to the room selector room directory setting.
### TERMINATE\_ON\_ERRORS
```gdscript
const TERMINATE_ON_ERRORS = "escoria/debug/terminate_on_errors"

```
Path to the terminate on errors setting.
### TERMINATE\_ON\_WARNINGS
```gdscript
const TERMINATE_ON_WARNINGS = "escoria/debug/terminate_on_warnings"

```
Path to the terminate on warnings setting.
### ENABLE\_HOVER\_STACK\_VIEWER
```gdscript
const ENABLE_HOVER_STACK_VIEWER = "escoria/debug/enable_hover_stack_viewer"

```
If enabled, displays the hover stack on screen
### PERFORM\_SCRIPT\_ANALYSIS\_AT\_RUNTIME
```gdscript
const PERFORM_SCRIPT_ANALYSIS_AT_RUNTIME = "escoria/debug/perform_script_analysis_at_runtime"

```
If enabled, performs analysis of scripts while the game is running. Used to help find potential issues at runtime.
### MASTER\_VOLUME
```gdscript
const MASTER_VOLUME = "escoria/sound/master_volume"

```
Path to the master volume setting.
### MUSIC\_VOLUME
```gdscript
const MUSIC_VOLUME = "escoria/sound/music_volume"

```
Path to the music volume setting.
### SFX\_VOLUME
```gdscript
const SFX_VOLUME = "escoria/sound/sfx_volume"

```
Path to the sfx volume setting.
### SPEECH\_ENABLED
```gdscript
const SPEECH_ENABLED = "escoria/sound/speech_enabled"

```
Path to the speech enabled setting.
### SPEECH\_EXTENSION
```gdscript
const SPEECH_EXTENSION = "escoria/sound/speech_extension"

```
Path to the speech extension setting.
### SPEECH\_FOLDER
```gdscript
const SPEECH_FOLDER = "escoria/sound/speech_folder"

```
Path to the speech folder setting.
### SPEECH\_VOLUME
```gdscript
const SPEECH_VOLUME = "escoria/sound/speech_volume"

```
Path to the speech volume setting.
### AMBIENT\_VOLUME
```gdscript
const AMBIENT_VOLUME = "escoria/sound/ambient_volume"

```
Path to the ambient volume setting.
### SKIP\_CACHE
```gdscript
const SKIP_CACHE = "escoria/platform/skip_cache"

```
Path to the skip cache setting.
### SKIP\_CACHE\_MOBILE
```gdscript
const SKIP_CACHE_MOBILE = "escoria/platform/skip_cache.mobile"

```
Path to the skip cache mobile setting.
### DISPLAY
```gdscript
const DISPLAY = "display"

```
Godot Windows project settings root.
### WINDOW
```gdscript
const WINDOW = "window"

```

### SIZE
```gdscript
const SIZE = "size"

```

### WINDOW\_MODE
```gdscript
const WINDOW_MODE = "display/window/size/mode"

```
Path to the window mode setting.
### FULLSCREEN
```gdscript
const FULLSCREEN = "display/window/size/fullscreen"

```
Path to the fullscreen setting.
## Methods
    
% ...
---
### register\_setting

```gdscript
func register_setting(name: String, default_value: Variant, info: Dictionary) -> void
```

Register a new project setting if it hasn't been defined already

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Fully qualified Project Settings key to register.|yes|
|default_value|`Variant`|Default value|yes|
|info|`Dictionary`|Property info for the setting|yes|

#### Returns

Returns nothing.
    
% ...
---
### remove\_setting

```gdscript
func remove_setting(name: String) -> void
```

Removes the specified project setting.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Fully qualified Project Settings key to remove.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_setting

```gdscript
func get_setting(key: String) -> Variant
```

Retrieves the specified project setting.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|key|`String`|Project setting name.|yes|

#### Returns

Returns the value of the project setting located with key. (`Variant`)
    
% ...
---
### set\_setting

```gdscript
func set_setting(key: String, value: Variant) -> void
```

Sets the specified project setting to the provided value.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|key|`String`|Project setting name.|yes|
|value|`Variant`|Project setting value.|yes|

#### Returns

Returns nothing.
    
% ...
---
### has\_setting

```gdscript
func has_setting(key: String) -> bool
```

Simple wrapper for consistency's sake.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|key|`String`|Project setting name.|yes|

#### Returns

Returns true iff the project setting exists. (`bool`)
