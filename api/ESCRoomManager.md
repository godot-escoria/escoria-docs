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

### change\_scene

```gdscript
func change_scene(room_path: String, enable_automatic_transitions: bool) -> void
```

Performs the actions needed in order to change the current scene to the one
specified by room_path.

#### Parameters

- room_path: Node path to the room that is to become the new current room.
- enable_automatic_transitions: Whether to play the transition between rooms
	automatically or to leave the responsibility to the developer.

### init\_room

```gdscript
func init_room(room: ESCRoom) -> void
```

Sanitize camera limits, add player node and set the global id to the
name of this node if it's not set manually

#### Parameters

- room: The ESCRoom to be initialized for use.