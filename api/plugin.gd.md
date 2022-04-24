<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# plugin.gd

**Extends:** [EditorPlugin](../EditorPlugin)

## Description

Plugin script to initialize Escoria

## Constants Descriptions

### ESCORIA

```gdscript
const ESCORIA: String = "/root/escoria"
```

The path to node 'escoria'.

## Property Descriptions

### escoria\_instance

```gdscript
var escoria_instance: Node
```

Reference to "escoria" singleton instance.

## Method Descriptions

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