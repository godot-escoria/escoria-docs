<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# main.gd

**Extends:** [Node](../Node)

## Description

Escoria main room handling and scene switcher

## Property Descriptions

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
var wait_level
```

The Escoria context currently in wait state

### scene\_transition

```gdscript
var scene_transition: ESCTransitionPlayer
```

Reference to the scene transition node

## Method Descriptions

### set\_scene

```gdscript
func set_scene(p_scene: Node) -> void
```

Set current scene

#### Parameters

- p_scene: Scene to set

### finish\_current\_scene\_init

```gdscript
func finish_current_scene_init(p_scene: Node) -> void
```

Only called by the room manager in the case where it hasn't executed a
coroutine prior to calling set_scene_finish().

### Parameters

- p_scene: The scene currently being initialized by set_scene.

### set\_scene\_finish

```gdscript
func set_scene_finish() -> void
```

Completes the room swap and should be called by the room manager at the
appropriate time.

### clear\_previous\_scene

```gdscript
func clear_previous_scene() -> void
```

Cleanup the previous scene if there was one.

### set\_camera\_limits

```gdscript
func set_camera_limits(camera_limit_id: int = 0, scene: Node) -> void
```

Set the camera limits

#### Parameters

* camera_limits_id: The id of the room's camera limits to set
* scene: The scene to set the camera limits for. We make this optional since
most times it'll be current_scene that needs setting; however, e.g. when
starting up Escoria, we might not have already set the current_scene.

### save\_game

```gdscript
func save_game(p_savegame_res: Resource) -> void
```

### check\_game\_scene\_methods

```gdscript
func check_game_scene_methods()
```

Sanity check that the game.tscn scene's root node script MUST
implement the following methods. If they do not exist, stop immediately.
Implement them, even if empty

## Signals

- signal room_ready(): Signal sent when the room is loaded and ready.
