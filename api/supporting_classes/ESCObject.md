
  (ESCObject)=
# ESCObject

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Represents an object that is able to be handled by Escoria.



## Constants

### ESC\_EVENTS\_CONTAINER\_SCRIPT
```gdscript
const ESC_EVENTS_CONTAINER_SCRIPT = <Object>

```

### STATE\_DEFAULT
```gdscript
const STATE_DEFAULT = "default"

```
Default object state.
## Members
    
### global\_id

```gdscript
var global_id: String
```

The global id of the object.
    
### active

```gdscript
var active: bool
```

Whether the object is active (i.e. is actually visible to the player).
    
### interactive

```gdscript
var interactive: bool
```

Whether the object is interactive (i.e. is clickable by the player).
    
### state

```gdscript
var state: String
```

The state of the object. If the object has a respective animation, it will be played.
    
### events

```gdscript
var events: Variant
```

The events registered with the object
    
### node

```gdscript
var node: Node
```

The node representing the object in the scene.

## Methods
    
% ...
---
### get\_state

```gdscript
func get_state() -> String
```

Gets the current state.

#### Parameters

None. 
#### Returns

Returns a `String` value. (`String`)
    
% ...
---
### set\_state

```gdscript
func set_state(p_state: String, immediate: bool) -> void
```

Set the state and start a possible animation.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|p_state|`String`|The state in which this object should placed.|yes|
|immediate|`bool`|If true, skips any animation directly to its end.|no|

#### Returns

Returns nothing.
    
% ...
---
### is\_active

```gdscript
func is_active() -> bool
```

Whether the object is active.

#### Parameters

None. 
#### Returns

Returns whether the object is active. (`bool`)
    
% ...
---
### get\_save\_data

```gdscript
func get_save_data() -> Dictionary
```

Return the data of the object to be inserted in a savegame file.

#### Parameters

None. 
#### Returns

Returns a `Dictionary` value. (`Dictionary`)
    
% ...
---
### has\_event\_with\_target

```gdscript
func has_event_with_target(event_name: String, event_target: Variant) -> bool
```

Determines whether the specified events list contains an event with the
specified event name and event target, e.g. `:give "filled_out_form"`

#### Parameters

- event_name: the event name to search for
- event_target: the target for the specified event to check; may be null

*Returns* true iff events contains an event matching both event_name and event_target
    
% ...
---
### get\_event\_with\_target

```gdscript
func get_event_with_target(event_name: String, event_target: Variant) -> Variant
```

Returns the event matching the specified event name and target, e.g. `:give "filled_out_form"`
if it exists; returns null otherwise.

#### Parameters

- event_name: the event name to search for
- event_target: the target for the specified event to check; may be null

*Returns* the event in `events` iff `events` contains an event matching both `event_name` and `event_target`;
returns null otherwise.
