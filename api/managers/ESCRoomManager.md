
  (ESCRoomManager)=
# ESCRoomManager

**Extends:** {ref}`Resource <Resource>`
        
## Description

A manager for rooms in a game. 



## Constants

### GLOBAL\_LAST\_SCENE
```gdscript
const GLOBAL_LAST_SCENE = "ESC_LAST_SCENE"

```
 Reserved global containing the global_id of previous room. Cannot be overriden.
### GLOBAL\_FORCE\_LAST\_SCENE\_NULL
```gdscript
const GLOBAL_FORCE_LAST_SCENE_NULL = "FORCE_LAST_SCENE_NULL"

```
Reserved global name determining whether ESC_LAST_SCENE is considered for automatic transitions.
### GLOBAL\_ANIMATION\_RESOURCES
```gdscript
const GLOBAL_ANIMATION_RESOURCES = "ANIMATION_RESOURCES"

```
Reserved global name containing the animations
### GLOBAL\_CURRENT\_SCENE
```gdscript
const GLOBAL_CURRENT_SCENE = "ESC_CURRENT_SCENE"

```
Reserved global name containing the global_id of the current room
### CAMERA\_SCENE\_PATH
```gdscript
const CAMERA_SCENE_PATH = "res://addons/escoria-core/game/scenes/camera_player/camera.tscn"

```
Path to escoria-core camera scene
### RESERVED\_GLOBALS
```gdscript
const RESERVED_GLOBALS = {"ANIMATION_RESOURCES": {}, "ESC_CURRENT_SCENE": "", "ESC_LAST_SCENE": "", "FORCE_LAST_SCENE_NULL": false}

```
Dictionary of the reserved globals to register and their initial values.
## Members

## Methods
    
% ...
---
### register\_reserved\_globals

```gdscript
func register_reserved_globals() -> void
```

Registers all reserved global flags for use.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### change\_scene\_to\_file

```gdscript
func change_scene_to_file(room_path: String, enable_automatic_transitions: bool) -> void
```

Performs the actions needed in order to change the current scene to the one specified by room_path.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|room_path|`String`|Node path to the room that is to become the new current room.|yes|
|enable_automatic_transitions|`bool`|Whether to play the transition between rooms automatically or to leave the responsibility to the developer.|yes|

#### Returns

Returns nothing.
    
% ...
---
### init\_room

```gdscript
func init_room(room: ESCRoom) -> void
```

Sanitize camera limits, add player node and set the global id to the name of this node if it's not set manually.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|room|`ESCRoom`|The ESCRoom to be initialized for use.|yes|

#### Returns

Returns nothing.
