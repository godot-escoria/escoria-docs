
  (ESCItem)=
# ESCItem

**Extends:** {ref}`Area2D <Area2D>`
        
## Description

An ``ESCItem`` defines a (usually interactive) item in the game.

When interacting with an ``ESCItem``, the game character will automatically walk to an ``ESCLocation`` that is created as a child of an ``ESCItem``.

By selecting the "Is Exit" checkbox when you create an ``ESCItem`` node, Escoria will look for an ``:exit_scene`` event in the attached script file. Any commands you place in the ``:exit_scene`` event will be run when the player chooses to "use" the exit - for example, saying a goodbye, or running a cutscene. Place a ``change_scene`` command inside this event to move the character to the next room.

## Constants

### FORBIDDEN\_CHARACTERS
```gdscript
const FORBIDDEN_CHARACTERS = "[\'\"]"

```
List of forbidden characters in global_ids
## Members
    
### global\_id

```gdscript
var global_id: String
```

The global ID of this item
    
### esc\_script

```gdscript
var esc_script: String
```

The ASHES script for this item
    
### camera\_node

```gdscript
var camera_node: NodePath
```

The node that references the camera position and zoom if this item is used as a camera target
    
### tooltip\_name

```gdscript
var tooltip_name: String
```

The name for the tooltip of this item.
    
### is\_movable

```gdscript
var is_movable: bool
```

Whether this item is movable. A movable item will be scaled with the terrain and be moved with commands like ``teleport`` and ``turn_to``.
    
### dialog\_color

```gdscript
var dialog_color: Color
```

Color used for dialogs if that item talks.
    
### default\_action

```gdscript
var default_action: String
```

Default action to use if object is not in the inventory.
    
### combine\_when\_selected\_action\_is\_in

```gdscript
var combine_when_selected_action_is_in: PackedStringArray
```

If action used by player is in this list, the game will wait for a second click on another item to combine objects together (typically `USE <X> WITH <Y>`, `GIVE <X> TO <Y>`)
    
### is\_exit

```gdscript
var is_exit: bool
```

If enabled, the ASHES script may have an :exit_scene event to manage scene changes. For simple exits that do not require scripted actions, the ESCExit node may be preferred.
    
### is\_trigger

```gdscript
var is_trigger: bool
```

Defines this item as acting as a trigger if enabled.
Allows using specific events (defined in trigger_in_verb and trigger_out_verb properties) in ASHES scripts.
    
### trigger\_in\_verb

```gdscript
var trigger_in_verb: String
```

Event name that is activated when another item enters the area defined by the trigger item. By default, "trigger_in".
    
### trigger\_out\_verb

```gdscript
var trigger_out_verb: String
```

Event name that is activated when another item exits the area defined by the trigger item. By default, "trigger_out".
    
### is\_interactive

```gdscript
var is_interactive: bool
```

Defines whether the player can interact with this item. If false, the item will not react to inputs and mouse hovers.
    
### hover\_enabled

```gdscript
var hover_enabled: bool
```

Defines whether Escoria will manage a specific hover behavior when the item is focused. All options below can be used together.
This can also be expanded or overriden in your ESCGame implementation (in methods ``element_focused()`` and ``element_unfocused()``).
    
### hover\_modulate

```gdscript
var hover_modulate: Color
```

If hover is enabled, applies this color modulation on the ESCItem sprite.
    
### hover\_texture

```gdscript
var hover_texture: Texture2D
```

If hover is enabled, replaces this ESCItem sprite texture by this one.
    
### hover\_shader

```gdscript
var hover_shader: ShaderMaterial
```

If hover is enabled, applies this shader to the ESCItem sprite.
    
### player\_orients\_on\_arrival

```gdscript
var player_orients_on_arrival: bool
```

Whether player character orients towards 'interaction_angle' as it arrives at the item's interaction position.
    
### interaction\_angle

```gdscript
var interaction_angle: int
```

If 'player_orients_on_arrival' is enabled, let the player character turn to this angle when it arrives at the item's interaction position.
    
### default\_action\_inventory

```gdscript
var default_action_inventory: String
```

Default action to use if object is in the inventory
    
### combine\_is\_one\_way

```gdscript
var combine_is_one_way: bool
```

If enabled, combination must be done in the way it is written in ASHES script ie. :use ON_ITEM
If disabled, combination will be tried in the other way.
    
### use\_from\_inventory\_only

```gdscript
var use_from_inventory_only: bool
```

If enabled, then the object must have been picked up before using it. Keep disabled for items in the background, such as buttons.
    
### inventory\_texture

```gdscript
var inventory_texture: Texture2D
```

The visual representation for this item when it's in the inventory
    
### inventory\_texture\_hovered

```gdscript
var inventory_texture_hovered: Texture2D
```

The visual representation for this item when it's in the inventory and hovered
    
### dont\_apply\_terrain\_scaling

```gdscript
var dont_apply_terrain_scaling: bool
```

If enabled, terrain scaling will not be applied and node will remain at the scale set in the scene.
    
### speed

```gdscript
var speed: int
```

Speed of this item if movable
    
### v\_speed\_damp

```gdscript
var v_speed_damp: float
```

Speed damp of this item if movable
    
### animations

```gdscript
var animations: ESCAnimationResource
```

 Animations resource for the item (walking, idling...)
    
### animation\_player\_node

```gdscript
var animation_player_node: NodePath
```

The node used to play animations
    
### custom\_data

```gdscript
var custom_data: Dictionary
```

Custom data dictionary to ease customization and custom command creation. Avoid name collision using proper key names.
    
### animation\_sprite

```gdscript
var animation_sprite: Variant
```

Reference to the animation node (null if none was found)
    
### terrain

```gdscript
var terrain: ESCTerrain
```

Reference to the current terrain
    
### collision

```gdscript
var collision: Node
```

Reference to this items collision shape node

## Signals

### mouse\_entered\_item

```gdscript
signal mouse_entered_item(item: Variant)
```

Emitted when the mouse has entered this item

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`Variant`|Item that emitted the signal.|yes|



### mouse\_exited\_item

```gdscript
signal mouse_exited_item(item: Variant)
```

Emitted when the mouse has exited this item

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|item|`Variant`|Item that emitted the signal.|yes|



### mouse\_left\_clicked\_item

```gdscript
signal mouse_left_clicked_item(global_id: Variant)
```

Emitted when the item was left clicked

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|global_id|`Variant`|ID of this item|yes|



### mouse\_double\_left\_clicked\_item

```gdscript
signal mouse_double_left_clicked_item(global_id: Variant)
```

Emitted when the item was double clicked

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|global_id|`Variant`|ID of this item|yes|



### mouse\_right\_clicked\_item

```gdscript
signal mouse_right_clicked_item(global_id: Variant)
```

Emitted when the item was right clicked

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|global_id|`Variant`|ID of this item|yes|



### arrived

```gdscript
signal arrived(walk_context: Variant)
```

Emitted when the item walked to a destination

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|walk_context|`Variant`|The walk context of the command|yes|



### started\_talking

```gdscript
signal started_talking()
```

Emitted when the item started talking. 


### stopped\_talking

```gdscript
signal stopped_talking()
```

Emitted when the item stopped talking. 


### started\_walking

```gdscript
signal started_walking()
```

Emitted when the item started walking. 


### stopped\_walking

```gdscript
signal stopped_walking()
```

Emitted when the item stopped walking. 


## Methods
    
% ...
---
### connect\_trigger\_events

```gdscript
func connect_trigger_events() -> void
```

For trigger items, enable monitoring to detect collisions.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### validate\_exported\_parameters

```gdscript
func validate_exported_parameters() -> void
```

Validates the various exported parameters so we get immediate crash.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### disconnect\_trigger\_events

```gdscript
func disconnect_trigger_events() -> void
```

For trigger items, disable monitoring to disable collisions detection.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### validate\_animations

```gdscript
func validate_animations(animations_resource: ESCAnimationResource) -> void
```

Validates the ESCAnimationResource if it exists. Note that we pass in the ESCAnimationResource as an argument so that it can also be used to validate an ESCAnimationResource prior to being set.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|animations_resource|`ESCAnimationResource`|Animation resource to validate before using it on this item.|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_animations

```gdscript
func set_animations(p_animations: ESCAnimationResource) -> void
```

Setter for the animations property.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_animations|`ESCAnimationResource`|the ESCAnimationResource to set.|yes|

#### Returns

Returns nothing.
    
% ...
---
### get\_animation\_player

```gdscript
func get_animation_player() -> Node
```

The animation player node

#### Parameters

None. 
#### Returns

Returns the animation player node. (`Node`)
    
% ...
---
### get\_interact\_position

```gdscript
func get_interact_position() -> Vector2
```

Return the position the player needs to walk to to interact with this item. That can either be a direct Position2D child or a collision shape

#### Parameters

None. 
#### Returns

Returns a `Vector2` value. (`Vector2`)
    
% ...
---
### mouse\_entered

```gdscript
func mouse_entered() -> void
```

React to the mouse entering the item by emitting the respective signal

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### do\_mouse\_exited

```gdscript
func do_mouse_exited() -> void
```

React to the mouse exiting the item by emitting the respective signal

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### teleport

```gdscript
func teleport(target: Node) -> void
```

Use the movable node to teleport this item to the target item

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|target|`Node`|Target node to teleport to|yes|

#### Returns

Returns nothing.
    
% ...
---
### teleport\_to

```gdscript
func teleport_to(target: Vector2) -> void
```

Use the movable node to teleport this item to the target position

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|target|`Vector2`|Vector2 position to teleport to|yes|

#### Returns

Returns nothing.
    
% ...
---
### walk\_to

```gdscript
func walk_to(pos: Vector2, p_walk_context: ESCWalkContext) -> void
```

Use the movable node to make the item walk to the given position

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pos|`Vector2`|Position to walk to|yes|
|p_walk_context|`ESCWalkContext`|Walk context to use|no|

#### Returns

Returns nothing.
    
% ...
---
### stop\_walking\_now

```gdscript
func stop_walking_now(to_target: bool) -> void
```

Stop the movable node immediately and remain where it is at this moment, or teleport it directly at destination position if 'to_target' is true.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|to_target|`bool`|if true, the movable node is teleport directly at its target destination|no|

#### Returns

Returns nothing.
    
% ...
---
### set\_velocity

```gdscript
func set_velocity(speed_value: int) -> void
```

Set the moving speed

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|speed_value|`int`|Set the new speed|yes|

#### Returns

Returns nothing.
    
% ...
---
### has\_moved

```gdscript
func has_moved() -> bool
```

Checks whether this item moved

#### Parameters

None. 
#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### has\_sprite

```gdscript
func has_sprite() -> bool
```

Checks whether this item has a sprite.

#### Parameters

None. 
#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### get\_sprite

```gdscript
func get_sprite() -> Node
```

Return the sprite node.

#### Parameters

None. 
#### Returns

Returns a `Node` value. (`Node`)
    
% ...
---
### set\_angle

```gdscript
func set_angle(deg: int, wait: float) -> void
```

Set the angle

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|deg|`int`|The angle degree to set|yes|
|wait|`float`|Wait this amount of seconds until continuing with turning around|no|

#### Returns

Returns nothing.
    
% ...
---
### set\_direction

```gdscript
func set_direction(direction_id: int, wait: float) -> void
```

Set the direction id

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|direction_id|`int`|The direction id|yes|
|wait|`float`|Wait this amount of seconds until continuing with turning around|no|

#### Returns

Returns nothing.
    
% ...
---
### turn\_to

```gdscript
func turn_to(object: Node, wait: float) -> void
```

Turn to face another object

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`Node`|Node whose position the item should face.|yes|
|wait|`float`|Optional delay in seconds before execution continues after turning.|no|

#### Returns

Returns nothing.
    
% ...
---
### check\_talk\_possible

```gdscript
func check_talk_possible() -> bool
```

Check everything is in place to play talk animations. A warning indicating the problem is printed in console, if necessary.

#### Parameters

None. 
#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### start\_talking

```gdscript
func start_talking() -> void
```

Play the talking animation

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### stop\_talking

```gdscript
func stop_talking() -> void
```

Stop playing the talking animation

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### update\_idle

```gdscript
func update_idle() -> void
```

Replay the last idle animation

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### get\_camera\_node

```gdscript
func get_camera_node() -> Node
```

Return the camera position if a camera_position_node exists or the global position of the player

#### Parameters

None. 
#### Returns

Returns a `Node` value. (`Node`)
    
% ...
---
### is\_moving

```gdscript
func is_moving() -> bool
```

Whether the item is currently moving.

#### Parameters

None. 
#### Returns

Returns true if the player is currently moving, false otherwise. (`bool`)
    
% ...
---
### get\_directions\_quantity

```gdscript
func get_directions_quantity() -> int
```

The number of defined animation directions for this ESCItem.

#### Parameters

None. 
#### Returns

Returns the number of defined animation directions for this ESCItem. (`int`)
    
% ...
---
### get\_custom\_data

```gdscript
func get_custom_data() -> Dictionary
```

A Dictionary containing custom data defined for this ESCItem.

#### Parameters

None. 
#### Returns

Returns a Dictionary containing custom data defined for this ESCItem. (`Dictionary`)
    
% ...
---
### set\_custom\_data

```gdscript
func set_custom_data(data: Dictionary) -> void
```

Sets the `custom_data` Dictionary containing custom data defined for this ESCItem.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|data|`Dictionary`|Custom data dictionary to assign to this item (an empty dictionary is used when `null`).|yes|

#### Returns

Returns nothing.
