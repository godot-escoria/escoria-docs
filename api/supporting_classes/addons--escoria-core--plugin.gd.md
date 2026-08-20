
  ("addons/escoria-core/plugin.gd")=
# "addons/escoria-core/plugin.gd"

**Extends:** {ref}`EditorPlugin <EditorPlugin>`
        
## Description

Plugin script to initialize Escoria



## Constants

### COMMA\_SEPARATOR
```gdscript
const COMMA_SEPARATOR = ","

```
Comma separator const used to build enabled extensions.
### ESC\_SCRIPT\_EXTENSION
```gdscript
const ESC_SCRIPT_EXTENSION = "esc"

```
ESC files extension.
### ASH\_SCRIPT\_EXTENSION
```gdscript
const ASH_SCRIPT_EXTENSION = "ash"

```

### ASHES\_ANALYZER\_MENU\_ITEM
```gdscript
const ASHES_ANALYZER_MENU_ITEM = "Analyze ASHES Scripts"

```

### ESC\_SHOW\_DEBUG\_PROMPT\_ACTION\_PATH
```gdscript
const ESC_SHOW_DEBUG_PROMPT_ACTION_PATH = "input/esc_show_debug_prompt"

```

## Members
    
### popup\_info

```gdscript
var popup_info: AcceptDialog
```

The warning popup displayed on escoria-core enabling.
    
### popup\_migration

```gdscript
var popup_migration: AcceptDialogMigrate4647
```

## Methods
    
% ...
---
### register\_setting

```gdscript
func register_setting(name: String, default: Variant, info: Dictionary) -> void
```

Register a new project setting if it hasn't been defined already

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Fully qualified Project Settings key to register.|yes|
|default|`Variant`|Default value|yes|
|info|`Dictionary`|Property info for the setting|yes|

#### Returns

Returns nothing.
