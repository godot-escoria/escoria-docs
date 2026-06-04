
  (StateMachine)=
# StateMachine

**Extends:** {ref}`Node <Node>`
        
## Description

Base interface for a generic state machine It handles initializing, setting the machine active or not delegating _physics_process, _input calls to the State nodes, and changing the current/active state.



## Members
    
### start\_state

```gdscript
var start_state: Node
```

Starting state. This node has to be set *before* the initialize(start_state) command is called.
    
### states\_map

```gdscript
var states_map: Variant
```

List of states
    
### states\_stack

```gdscript
var states_stack: Variant
```

Stack of states
    
### current\_state

```gdscript
var current_state: Variant
```

Value of the current state
    
### current\_state\_name

```gdscript
var current_state_name: Variant
```

Name of the current state

## Signals

### state\_changed

```gdscript
signal state_changed(current_state: Variant)
```

Signal emitted when the state has changed. Parameter is the new current state.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|current_state|`Variant`|Instance of the state that became active.|yes|



## Methods
    
% ...
---
### initialize

```gdscript
func initialize(start_state: State) -> void
```

Initialize the state machine with the start_state parameter.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|start_state|`State`|State value to use as starting state for the state machine.|yes|

#### Returns

Returns nothing.
    
% ...
---
### set\_active

```gdscript
func set_active(value: bool) -> void
```

Enable or disable the state machine.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|value|`bool`|if true, enables the state machine. If false, disables it.|yes|

#### Returns

Returns nothing.
