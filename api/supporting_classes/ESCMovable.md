
  (ESCMovable)=
# ESCMovable

**Extends:** {ref}`Node <Node>`
        
## Description

Node that performs the moving (walk, teleport, terrain scaling...) actions on its parent node.



## Constants

### NONE
```gdscript
const NONE = 0 # enum "MovableTask"

```

### WALK
```gdscript
const WALK = 1 # enum "MovableTask"

```

### SLIDE
```gdscript
const SLIDE = 2 # enum "MovableTask"

```

## Members
    
### walk\_path

```gdscript
var walk_path: Array
```

Character path through the scene as calculated by the Pathfinder
    
### path\_ofs

```gdscript
var path_ofs: int
```

Current active walk path entry
    
### walk\_destination

```gdscript
var walk_destination: Vector2
```

The destination where the character should be moving to
    
### walk\_context

```gdscript
var walk_context: ESCWalkContext
```

The walk context currently carried out by this movable node
    
### moved

```gdscript
var moved: bool
```

Whether the character was moved at all
    
### last\_dir

```gdscript
var last_dir: int
```

Player Direction used to reflect the movement to the new position
    
### last\_angle

```gdscript
var last_angle: float
```

Last angle calculated
    
### last\_scale

```gdscript
var last_scale: Vector2
```

The last scaling applied to the parent
    
### is\_mirrored

```gdscript
var is_mirrored: bool
```

Whether the current direction animation is flipped
    
### parent

```gdscript
var parent: Variant
```

Shortcut variable that references the node's parent
    
### task

```gdscript
var task: Variant
```

Currenly running task

## Methods
    
% ...
---
### teleport

```gdscript
func teleport(target: Node) -> void
```

Teleports this item to the target position.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|target|`Node`|ESCLocation or ESCItem to teleport to|yes|

#### Returns

Returns nothing.
    
% ...
---
### teleport\_to

```gdscript
func teleport_to(target: Vector2) -> void
```

Teleports this item to the target position.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|target|`Vector2`|Vector2 target position to teleport to|yes|

#### Returns

Returns nothing.
    
% ...
---
### walk\_to

```gdscript
func walk_to(pos: Vector2, p_walk_context: ESCWalkContext) -> void
```

Walk to a given position

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pos|`Vector2`|Position to walk to|yes|
|p_walk_context|`ESCWalkContext`|Walk context to use|no|

#### Returns

Returns nothing.
    
% ...
---
### walk\_stop

```gdscript
func walk_stop(pos: Vector2) -> void
```

We have finished walking. Set the idle pose and complete.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pos|`Vector2`|Final target position|yes|

#### Returns

Returns nothing.
    
% ...
---
### update\_terrain

```gdscript
func update_terrain(on_event_finished_name: Variant) -> void
```

Update the sprite scale and lighting.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|on_event_finished_name|`Variant`|Used if this function is called from an ESC event|no|

#### Returns

Returns nothing.
    
% ...
---
### set\_angle

```gdscript
func set_angle(deg: int, wait: float) -> void
```

Sets the character's facing angle and plays the corresponding idle animation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|deg|`int`|Absolute angle in degrees (0-360) the character should face.|yes|
|wait|`float`|Optional delay in seconds before the script continues after turning.|no|

#### Returns

Returns nothing.
    
% ...
---
### set\_direction

```gdscript
func set_direction(target_dir: int, wait: float) -> void
```

Sets character's direction (instead of angle, see set_angle() and plays according animation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|target_dir|`int`|int direction to set the character|yes|
|wait|`float`|float Wait this amount of seconds until continuing with turning around|no|

#### Returns

Returns nothing.
    
% ...
---
### turn\_to

```gdscript
func turn_to(item: Node, wait: float) -> void
```

Rotates the character so it faces the supplied node and plays the matching animation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`Node`|Target node whose position the character should face.|yes|
|wait|`float`|Optional delay in seconds before the script continues after turning.|no|

#### Returns

Returns nothing.
    
% ...
---
### get\_shortest\_way\_to\_dir

```gdscript
func get_shortest_way_to_dir(current_dir: int, target_dir: int) -> int
```

Return the shortest way to turn from a direction to another. Returned way is either: -1 (shortest way is to turn anti-clockwise) 0 (already at the right direction) 1 (clockwise).

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|current_dir|`int`|integer corresponding to the starting direction as defined in the attached ESCAnimationResource.directions.|yes|
|target_dir|`int`|integer corresponding to the target direction as defined in the attached ESCAnimationResource.directions.|yes|

#### Returns

Returns a `int` value. (`int`)
