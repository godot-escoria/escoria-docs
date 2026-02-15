
  (ESCRoom)=
# ESCRoom

**Extends:** {ref}`Node2D <Node2D>`
        
## Description

A room in an Escoria based game.



## Constants

### NONE
```gdscript
const NONE = 0 # enum "EditorRoomDebugDisplay"

```

### CAMERA\_LIMITS
```gdscript
const CAMERA_LIMITS = 1 # enum "EditorRoomDebugDisplay"

```

## Members
    
### global\_id

```gdscript
var global_id: String
```

The global id of this room
    
### esc\_script

```gdscript
var esc_script: String
```

The ASHES script of this room
    
### player\_scene

```gdscript
var player_scene: PackedScene
```

The player scene to use inside this room
    
### camera\_limits

```gdscript
var camera_limits: Array
```

The camera limits available in this room
    
### editor\_debug\_mode

```gdscript
var editor_debug_mode: int
```

The room's debug display mode.
Camera Limits: show a colored frame for each camera limit of the room.
None: no debug display
    
### player

```gdscript
var player: Variant
```

Container of the player scene instance.
    
### player\_camera

```gdscript
var player_camera: ESCCamera
```

Container of player camera
    
### game

```gdscript
var game: Variant
```

Container of game scene instance
    
### compiled\_script

```gdscript
var compiled_script: ESCScript
```

Container of compiled ESCScript
    
### enabled\_automatic\_transitions

```gdscript
var enabled_automatic_transitions: Variant
```

 Whether automatic transition are enabled or not. This is modified by the Room Manager.
    
### is\_run\_directly

```gdscript
var is_run_directly: Variant
```

## Methods
    
% ...
---
### set\_camera\_limits

```gdscript
func set_camera_limits(p_camera_limits: Array) -> void
```
    
% ...
---
### set\_editor\_debug\_mode

```gdscript
func set_editor_debug_mode(p_editor_debug_mode: int) -> void
```
