
  ("addons/escoria-core/game/main.gd")=
# "addons/escoria-core/game/main.gd"

**Extends:** {ref}`Node <Node>`
        
## Description

Escoria main scene script.

This script is basically the scene-switcher.

## Members
    
### last\_scene\_global\_id

```gdscript
var last_scene_global_id: String
```

Global id of the last scene the player was before current scene
    
### current\_scene

```gdscript
var current_scene: Node
```

Current scene room being displayed
    
### previous\_scene

```gdscript
var previous_scene: Node
```

Scene that was previously the current scene.
    
### wait\_level

```gdscript
var wait_level: Variant
```

The Escoria context currently in wait state
    
### scene\_transition

```gdscript
var scene_transition: ESCTransitionPlayer
```

Reference to the scene transition node

## Signals

### room\_ready

```gdscript
signal room_ready()
```

Signal sent when the room is loaded and ready.

#### Parameters

None. 


## Methods
    
% ...
---
### set\_scene

```gdscript
func set_scene(p_scene: Node) -> void
```

Sets the current scene

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_scene|`Node`|Scene to set|yes|

#### Returns

Returns nothing.
    
% ...
---
### finish\_current\_scene\_init

```gdscript
func finish_current_scene_init(p_scene: Node) -> void
```

Only called by the room manager in the case where it hasn't executed a coroutine prior to calling set_scene_finish(). ### Parameters

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_scene|`Node`|The scene currently being initialized by set_scene.|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_scene\_finish

```gdscript
func set_scene_finish() -> void
```

Completes the room swap and should be called by the room manager at the appropriate time.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### clear\_previous\_scene

```gdscript
func clear_previous_scene() -> void
```

Cleanup the previous scene if there was one.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### set\_camera\_limits

```gdscript
func set_camera_limits(camera_limit_id: int, scene: Node) -> void
```

Set the camera limits

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|camera_limit_id|`int`|Index of the camera limit configuration to apply.|no|
|scene|`Node`|The scene to set the camera limits for. We make this optional since most times it'll be current_scene that needs setting; however, e.g. when starting up Escoria, we might not have already set the current_scene. camera_limits_id The id of the room's camera limits to set|no|

#### Returns

Returns nothing.
    
% ...
---
### save\_game

```gdscript
func save_game(p_savegame_res: Resource) -> void
```

Save the game state to the provided savegame resource.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_savegame_res|`Resource`|The savegame resource to write to.|yes|

#### Returns

Returns nothing.
    
% ...
---
### check\_game\_scene\_methods

```gdscript
func check_game_scene_methods() -> void
```

Sanity check that the game.tscn scene's root node script MUST implement the following methods. If they do not exist, stop immediately. Implement them, even if empty

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### hide\_ui

```gdscript
func hide_ui() -> void
```

Hide the UI of the current scene.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### hide\_current\_scene

```gdscript
func hide_current_scene() -> void
```

Hide the current scene.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### show\_ui

```gdscript
func show_ui() -> void
```

Show the UI of the current scene.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### show\_current\_scene

```gdscript
func show_current_scene() -> void
```

Show the current scene.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### stop\_all\_sounds

```gdscript
func stop_all_sounds() -> void
```

Stops all sound channels.

#### Parameters

None. 
#### Returns

Returns nothing.
