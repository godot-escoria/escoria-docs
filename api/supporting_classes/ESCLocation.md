
  (ESCLocation)=
# ESCLocation

**Extends:** {ref}`Marker2D <Marker2D>`
        
## Description

 A simple node extending Position2D with a global ID so that it can be referenced in ESC Scripts. Movement-based commands like `walk_to_pos` will automatically use an `ESCLocation` that is a child of the destination node. Commands like `turn_to`--which are not movement-based--will ignore child `ESCLocation`s and refer to the parent node.



## Constants

### MULTIPLE\_START\_LOCATIONS\_WARNING
```gdscript
const MULTIPLE_START_LOCATIONS_WARNING = "Only 1 ESCLocation should have is_start_location set to true in an ESCRoom"

```
Warning message: multiple start locations set in the room..
## Members
    
### global\_id

```gdscript
var global_id: String
```

The global ID of this ESCLocation
    
### is\_start\_location

```gdscript
var is_start_location: bool
```

If enabled, this `ESCLocation` is considered as a player start location for this room.
    
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

## Signals

### editor\_is\_start\_location\_set

```gdscript
signal editor_is_start_location_set(node_to_ignore: ESCLocation)
```

Escoria Plugin signal emitted to the `ESCRoom` when a start location is set in the `ESCLocation` node in order to check whether multiple start locations are set.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|node_to_ignore|`ESCLocation`| `ESCLocation` that should be ignored while validating start locations. Defaults to `null`.|no|



## Methods
    
% ...
---
### is\_class

```gdscript
func is_class(p_classname: String) -> bool
```

Used by "is" keyword to check whether a node's class_name is the same as p_classname. ## Parameters p_classname: String class to compare against

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_classname|`String`|Class name to compare against this location.|yes|

#### Returns

Returns a `bool` value. (`bool`)
    
% ...
---
### set\_multiple\_start\_locations\_exist

```gdscript
func set_multiple_start_locations_exist(value: bool) -> void
```

Escoria editor plugin: Setter for _multiple_start_locations_exist member. Updates the warnings displayed in the editor's scene tree.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|value|`bool`|true whether multiple start locations exist in the room.|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_is\_start\_location

```gdscript
func set_is_start_location(value: bool) -> void
```

Escoria editor plugin: Setter for is_start_location member. Notifies the ESCRoom of the change.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|value|`bool`|true whether the ESCLocation node was set as start location.|yes|

#### Returns

Returns nothing.
