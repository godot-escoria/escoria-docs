<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCRoom

**Extends:** [Node2D](../Node2D)

## Description

A room in an Escora based game

## Enumerations

### EditorRoomDebugDisplay

```gdscript
const EditorRoomDebugDisplay: Dictionary = {"CAMERA_LIMITS":1,"NONE":0}
```

Debugging displays for a room
NONE: No debug display
CAMERA_LIMITS: Display the camera limits

## Property Descriptions

### global\_id

```gdscript
export var global_id = ""
```

The global id of this room

### esc\_script

```gdscript
export var esc_script = ""
```

The ESC script of this room

### player\_scene

```gdscript
export var player_scene = "[Object:null]"
```

The player inside this scene

### camera\_limits

```gdscript
export var camera_limits: Array = ["(0, 0, 0, 0)"]
```

- **Setter**: `set_camera_limits`

The camera limits available in this room

### editor\_debug\_mode

```gdscript
export var editor_debug_mode = 0
```

- **Setter**: `set_editor_debug_mode`

The editor debug display mode

### player

```gdscript
var player
```

The player scene instance

### game

```gdscript
var game
```

The game scene instance

### compiled\_script

```gdscript
var compiled_script: ESCScript
```

Compiled ESCScript

### enabled\_automatic\_transitions

```gdscript
var enabled_automatic_transitions
```

 Whether automatic transition are enabled or not

### is\_run\_directly

```gdscript
var is_run_directly
```

Whether this room was run directly with Play Scene (F6)

### exited\_previous\_room

```gdscript
var exited_previous_room
```

Whether this room was accessed from an exit in a previous room

## Method Descriptions

### perform\_script\_events

```gdscript
func perform_script_events()
```

### set\_camera\_limits

```gdscript
func set_camera_limits(p_camera_limits: Array) -> void
```

Set the camera limits

#### Parameters

- p_camera_limits: An array of Rect2Ds as camera limits

### set\_editor\_debug\_mode

```gdscript
func set_editor_debug_mode(p_editor_debug_mode: int) -> void
```

Set the editor debug mode

#### Parameters

- p_editor_debug_mode: The debug mode to set for the room

## Signals

- signal room_setup_done(): Emitted when room has finished ":setup" event.
- signal room_ready_done(): Emitted when room has finished ":ready" event.
