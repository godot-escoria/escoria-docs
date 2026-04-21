
  (ESCEventsContainer)=
# ESCEventsContainer

**Extends:** {ref}`RefCounted <RefCounted>`
        
## Description

Container for storing events in Escoria, providing a consistent way to provide visibility and access to events.



## Members
    
### events

```gdscript
var events: Array
```

The list of events being tracked.

## Methods
    
% ...
---
### add

```gdscript
func add(event: Variant) -> void
```

Adds an event to the container.

#### Parameters

- event: the event to be stored
    
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
