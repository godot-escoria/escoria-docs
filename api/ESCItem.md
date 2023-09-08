<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCItem

**Extends:** [Area2D](../Area2D)

## Description

An ``ESCItem`` defines a (usually interactive) item in the game.

When interacting with an ``ESCItem``, the game character will automatically
walk to an ``ESCLocation`` that is created as a child of an ``ESCItem``.

By selecting the "Is Exit" checkbox when you create an ``ESCItem``
node, Escoria will look for an ``:exit_scene`` event in the attached script file.
Any commands you place in the ``:exit_scene`` event will be run when the player
chooses to "use" the exit - for example, saying a goodbye, or running a
cutscene. Place a ``change_scene`` command inside this event to move the
character to the next room.

## Constants Descriptions

### FORBIDDEN\_CHARACTERS

```gdscript
const FORBIDDEN_CHARACTERS: String = "['\"]"
```

List of forbidden characters in global_ids

### GROUP\_ITEM\_CAN\_COLLIDE

```gdscript
const GROUP_ITEM_CAN_COLLIDE: String = "item_can_collide"
```

Group for ESCItem's that can be collided with in a scene. Used for quick
retrieval of such nodes to easily change their attributes at the same time.

## Property Descriptions

### global\_id

```gdscript
export var global_id = ""
```

The global ID of this item

### esc\_script

```gdscript
export var esc_script = ""
```

The ESC script for this item

### is\_exit

```gdscript
export var is_exit = false
```

If true, the ESC script may have an ``:exit_scene`` event to manage scene changes.
For simple exits that do not require scripted actions, the ``ESCExit`` node may be
preferred.

### is\_trigger

```gdscript
export var is_trigger = false
```

If true, object is considered as trigger. Allows using :trigger_in and
:trigger_out verbs in ESC scripts.

### trigger\_in\_verb

```gdscript
export var trigger_in_verb = "trigger_in"
```

The verb used for the trigger in ESC events

### trigger\_out\_verb

```gdscript
export var trigger_out_verb = "trigger_out"
```

The verb used for the trigger out ESC events

### is\_interactive

```gdscript
export var is_interactive = true
```

If true, the player can interact with this item

### is\_movable

```gdscript
export var is_movable = false
```

Whether this item is movable. A movable item will be scaled with the terrain
and be moved with commands like teleport and turn_to.

### player\_orients\_on\_arrival

```gdscript
export var player_orients_on_arrival = true
```

If true, player orients towards the direction corresponding to angle 
'interaction_angle' (in degrees) as player character arrives.

### interaction\_angle

```gdscript
export var interaction_angle = 0
```

Let the player turn to the direction corresponding to angle value
(in degrees) when the player arrives at the item.

### tooltip\_name

```gdscript
export var tooltip_name = ""
```

The name for the tooltip of this item

### default\_action

```gdscript
export var default_action = ""
```

Default action to use if object is not in the inventory

### default\_action\_inventory

```gdscript
export var default_action_inventory = ""
```

Default action to use if object is in the inventory

### combine\_when\_selected\_action\_is\_in

```gdscript
export var combine_when_selected_action_is_in = []
```

If action used by player is in this list, the game will wait for a second
click on another item to combine objects together (typical
`USE <X> WITH <Y>`, `GIVE <X> TO <Y>`)

### combine\_is\_one\_way

```gdscript
export var combine_is_one_way = false
```

If true, combination must be done in the way it is written in ESC script
ie. :use ON_ITEM
If false, combination will be tried in the other way.

### use\_from\_inventory\_only

```gdscript
export var use_from_inventory_only = false
```

If true, then the object must have been picked up before using it.
A false value is useful for items in the background, such as buttons.

### inventory\_texture

```gdscript
export var inventory_texture: Texture = "[Object:null]"
```

The visual representation for this item when its in the inventory

### dialog\_color

```gdscript
export var dialog_color = "0,0,0,1"
```

Color used for dialogs

### dont\_apply\_terrain\_scaling

```gdscript
export var dont_apply_terrain_scaling = false
```

If true, terrain scaling will not be applied and
node will remain at the scale set in the scene.

### speed

```gdscript
export var speed: int = 300
```

Speed of this item ifmovable

### v\_speed\_damp

```gdscript
export var v_speed_damp: float = 1
```

Speed damp of this item if movable

### animation\_player\_node

```gdscript
export var animation_player_node: NodePath = ""
```

The node used to play animations

### camera\_node

```gdscript
export var camera_node = ""
```

The node that references the camera position and zoom if this item is used
as a camera target

### animations

```gdscript
var animations: ESCAnimationResource
```

- **Setter**: `set_animations`

 ESCAnimationsResource (for walking, idling...)

### animation\_sprite

```gdscript
var animation_sprite
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

## Method Descriptions

### validate\_exported\_parameters

```gdscript
func validate_exported_parameters() -> void
```

Validates the various exported parameters so we get immediate crash.

### validate\_animations

```gdscript
func validate_animations(animations_resource: ESCAnimationResource) -> void
```

Validates the ESCAnimationResource if it exists. Note that we pass in the
ESCAnimationResource as an argument so that it can also be used to validate
an ESCAnimationResource prior to being set.

#### Parameters

- animation_resource: the ESCAnimationResource to validate.

### set\_animations

```gdscript
func set_animations(p_animations: ESCAnimationResource) -> void
```

Setter for the animations property.

### get\_animation\_player

```gdscript
func get_animation_player() -> Node
```

Return the animation player node

### get\_interact\_position

```gdscript
func get_interact_position() -> Vector2
```

Return the position the player needs to walk to to interact with this
item. That can either be a direct Position2D child or a collision shape

**Returns** The interaction position

### mouse\_entered

```gdscript
func mouse_entered()
```

React to the mouse entering the item by emitting the respective signal

### mouse\_exited

```gdscript
func mouse_exited()
```

React to the mouse exiting the item by emitting the respective signal

### element\_entered

```gdscript
func element_entered(body)
```

Another item (e.g. the player) has entered this item

#### Parameters

- body: Other object that has entered the item

### element\_exited

```gdscript
func element_exited(body)
```

Another item (e.g. the player) has exited this element
#### Parameters

- body: Other object that has entered the item

### teleport

```gdscript
func teleport(target: Node) -> void
```

Use the movable node to teleport this item to the target item

#### Parameters

- target: Target node to teleport to

### teleport\_to

```gdscript
func teleport_to(target: Vector2) -> void
```

Use the movable node to teleport this item to the target position

#### Parameters

- target: Vector2 position to teleport to

### walk\_to

```gdscript
func walk_to(pos: Vector2, p_walk_context: ESCWalkContext = null) -> void
```

Use the movable node to make the item walk to the given position

#### Parameters

- pos: Position to walk to
- p_walk_context: Walk context to use

### stop\_walking\_now

```gdscript
func stop_walking_now(to_target: bool = false) -> void
```

Stop the movable node immediately and remain where it is at this moment,
or teleport it directly at destination position if 'to_target' is true.

#### Parameters

- to_target: if true, the movable node is teleport directly at its target
destination

### set\_speed

```gdscript
func set_speed(speed_value: int) -> void
```

Set the moving speed

#### Parameters

- speed_value: Set the new speed

### has\_moved

```gdscript
func has_moved() -> bool
```

Check whether this item moved

### get\_sprite

```gdscript
func get_sprite() -> Node
```

Return the sprite node

### set\_angle

```gdscript
func set_angle(deg: int, wait: float = 0)
```

Set the angle

#### Parameters

- deg: The angle degree to set
- wait: Wait this amount of seconds until continuing with turning around

### turn\_to

```gdscript
func turn_to(object: Node, wait: float = 0)
```

Turn to face another object

#### Parameters

- deg: The angle degree to set
- float Wait this amount of seconds until continuing with turning around

### check\_talk\_possible

```gdscript
func check_talk_possible()
```

Check everything is in place to play talk animations

### start\_talking

```gdscript
func start_talking()
```

Play the talking animation

### stop\_talking

```gdscript
func stop_talking()
```

Stop playing the talking animation

### update\_idle

```gdscript
func update_idle()
```

Replay the last idle animation

### get\_camera\_node

```gdscript
func get_camera_node()
```

Return the camera position if a camera_position_node exists or the
global position of the player

### is\_moving

```gdscript
func is_moving() -> bool
```

Whether the item is currently moving.

*Returns*
Returns true if the player is currently moving, false otherwise

## Signals

- signal mouse_entered_item(item): Emitted when the mouse has entered this item

#### Parameters

- items: The inventory item node
- signal mouse_exited_item(item): Emitted when the mouse has exited this item

#### Parameters

- items: The inventory item node
- signal mouse_left_clicked_item(global_id): Emitted when the item was left cliced

#### Parameters

- global_id: ID of this item
- signal mouse_double_left_clicked_item(global_id): Emitted when the item was double cliced

#### Parameters

- global_id: ID of this item
- signal mouse_right_clicked_item(global_id): Emitted when the item was right cliced

#### Parameters

- global_id: ID of this item
- signal arrived(walk_context): Emitted when the item walked to a destination

#### Parameters

- walk_context: The walk context of the command

## Sub\-classes

### HoverStackSorter

#### Method Descriptions

### sort\_ascending\_z\_index <small>(static)</small>

```gdscript
func sort_ascending_z_index(a, b)
```

