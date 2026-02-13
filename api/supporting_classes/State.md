
  (State)=
# State

**Extends:** {ref}`Node <Node>`
        
## Description

Base interface for all states.

This class doesn't do anything in itself but forces us to pass the right arguments to the methods below and makes sure every State object had all of these methods.

## Signals

### finished

```gdscript
signal finished(next_state_name: Variant)
```

Signal sent when the state just changed. Parameter is the new state value.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|next_state_name|`Variant`|Name of the state that should become active after this state finishes.|yes|



## Methods
    
% ...
---
### enter

```gdscript
func enter() -> Variant
```

Initialize the state. E.g. change the animation

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### exit

```gdscript
func exit() -> Variant
```

Clean up the state. Reinitialize values like a timer.

#### Parameters

None. 
#### Returns

Returns nothing.
    
% ...
---
### handle\_input

```gdscript
func handle_input(_event: InputEvent) -> Variant
```

Manage an input event while this state is active.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|_event|`InputEvent`|InputEvent to process|yes|

#### Returns

Returns nothing.
    
% ...
---
### update

```gdscript
func update(_delta: float) -> Variant
```

Perform an update while this state is active.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|_delta|`float`|float value obtained from a _process() call|yes|

#### Returns

Returns nothing.
