<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCRoomManager

**Extends:** [Object](../Object)

## Description

## Constants Descriptions

### GLOBAL\_ANIMATION\_RESOURCES

```gdscript
const GLOBAL_ANIMATION_RESOURCES: String = "ANIMATION_RESOURCES"
```

### GLOBAL\_CURRENT\_SCENE

```gdscript
const GLOBAL_CURRENT_SCENE: String = "ESC_CURRENT_SCENE"
```

Contains the global_id of the current room

### GLOBAL\_FORCE\_LAST\_SCENE\_NULL

```gdscript
const GLOBAL_FORCE_LAST_SCENE_NULL: String = "FORCE_LAST_SCENE_NULL"
```

If true, ESC_LAST_SCENE is not considered for automatic transitions

### GLOBAL\_LAST\_SCENE

```gdscript
const GLOBAL_LAST_SCENE: String = "ESC_LAST_SCENE"
```

Reserved globals which can not be overridden; prefixed with "GLOBAL_"

 Contains the global_id of previous room

### RESERVED\_GLOBALS

```gdscript
const RESERVED_GLOBALS: Dictionary = {"ANIMATION_RESOURCES":{},"ESC_CURRENT_SCENE":"","ESC_LAST_SCENE":"","FORCE_LAST_SCENE_NULL":false}
```

Dict of the reserved globals to register and their initial values.

## Method Descriptions

### register\_reserved\_globals

```gdscript
func register_reserved_globals() -> void
```

Registers all reserved global flags for use.