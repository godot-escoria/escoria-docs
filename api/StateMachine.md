<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# StateMachine

**Extends:** [Node](../Node)

## Description

## Property Descriptions

### START\_STATE

```gdscript
export var START_STATE = ""
```

### states\_map

```gdscript
var states_map
```

### states\_stack

```gdscript
var states_stack
```

can also be used as a pushdown automaton

### current\_state

```gdscript
var current_state
```

### current\_state\_name

```gdscript
var current_state_name
```

## Method Descriptions

### initialize

```gdscript
func initialize(start_state)
```

### set\_active

```gdscript
func set_active(value)
```

### get\_current\_state\_name

```gdscript
func get_current_state_name()
```

## Signals

- signal state_changed(current_state): 
