<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# ESCLocation

**Extends:** [Position2D](../Position2D)

## Description

 A simple node extending Position2D with a global ID so that it can be
referenced in ESC Scripts. Movement-based commands like `walk_to_pos` will
automatically use an `ESCLocation` that is a child of the destination node.
Commands like `turn_to`--which are not movement-based--will ignore child
`ESCLocation`s and refer to the parent node.

## Constants Descriptions

### MULTIPLE\_START\_LOCATIONS\_WARNING

```gdscript
const MULTIPLE_START_LOCATIONS_WARNING: String = "Only 1 ESCLocation should have is_start_location set to true in an ESCRoom"
```

## Property Descriptions

### global\_id

```gdscript
export var global_id = ""
```

The global ID of this item

### is\_start\_location

```gdscript
export var is_start_location = false
```

- **Setter**: `set_is_start_location`

If true, this ESCLocation is considered as a player start location

### player\_orients\_on\_arrival

```gdscript
export var player_orients_on_arrival = true
```

If true, player orients towards 'interaction_direction' as
player character arrives.

### interaction\_direction

```gdscript
export var interaction_direction = 0
```

Let the player turn to this direction when the player arrives
at the item

## Method Descriptions

### is\_class

```gdscript
func is_class(p_classname: String) -> bool
```

Used by "is" keyword to check whether a node's class_name
is the same as p_classname.

## Parameters

p_classname: String class to compare against

### set\_multiple\_locations\_exist

```gdscript
func set_multiple_locations_exist(value: bool) -> void
```

### set\_is\_start\_location

```gdscript
func set_is_start_location(value: bool) -> void
```

## Signals

- signal is_start_location_set(): 
