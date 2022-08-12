<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# plugin.gd

**Extends:** [EditorPlugin](../EditorPlugin)

## Description

Plugin script to initialize Escoria

## Property Descriptions

### popup\_info

```gdscript
var popup_info: AcceptDialog
```

The warning popup displayed on escoria-core enabling.

## Method Descriptions

### enable\_plugin

```gdscript
func enable_plugin()
```

Virtual function called when plugin is enabled.

### disable\_plugin

```gdscript
func disable_plugin()
```

Virtual function called when plugin is disabled.

### set\_escoria\_ui\_settings

```gdscript
func set_escoria_ui_settings()
```

Prepare the settings in the Escoria UI category

### set\_escoria\_main\_settings

```gdscript
func set_escoria_main_settings()
```

Prepare the settings in the Escoria main category

### set\_escoria\_debug\_settings

```gdscript
func set_escoria_debug_settings()
```

Prepare the settings in the Escoria debug category

### set\_escoria\_sound\_settings

```gdscript
func set_escoria_sound_settings()
```

Prepare the settings in the Escoria sound settings

### set\_escoria\_platform\_settings

```gdscript
func set_escoria_platform_settings()
```

Prepare the settings in the Escoria platform category and may need special
setting per build

### register\_setting <small>(static)</small>

```gdscript
func register_setting(name: String, default, info: Dictionary) -> void
```

Register a new project setting if it hasn't been defined already

#### Parameters

- name: Name of the project setting
- default: Default value
- info: Property info for the setting