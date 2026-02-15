
  (ESCTransitionPlayer)=
# ESCTransitionPlayer

**Extends:** {ref}`ColorRect <ColorRect>`
        
## Description

A transition player for scene changes



## Constants

### IN
```gdscript
const IN = 0 # enum "TRANSITION\_MODE"

```

### OUT
```gdscript
const OUT = 1 # enum "TRANSITION\_MODE"

```

### TRANSITION\_ID\_INSTANT
```gdscript
const TRANSITION_ID_INSTANT = -1

```
Id to represent instant/no transitions
### TRANSITION\_INSTANT
```gdscript
const TRANSITION_INSTANT = "instant"

```
Instant transition type
## Members
    
### transition\_id

```gdscript
var transition_id: int
```

Id of the transition. Allows keeping track of the actual transition being played or finished

## Signals

### transition\_done

```gdscript
signal transition_done(transition_id: Variant)
```

Emitted when the transition was played

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|transition_id|`Variant`|Identifier of the transition that completed.|yes|



## Methods
    
% ...
---
### transition

```gdscript
func transition(transition_name: String, mode: int, duration: float) -> int
```

Play a transition animation

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|transition_name|`String`|Name of the transition to play (if empty string, uses the default transition).|no|
|mode|`int`|Mode to transition (in/out).|no|
|duration|`float`|The duration the transition should take.|no|

#### Returns

Returns the transition id. (`int`)
    
% ...
---
### get\_transition

```gdscript
func get_transition(name: String) -> String
```

The full path for a transition shader based on its name

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Transition name whose material path should be resolved.|yes|

#### Returns

Returns the full path for a transition shader based on its name the full path to the shader or an empty string if it can't be found. (`String`)
    
% ...
---
### has\_transition

```gdscript
func has_transition(name: String) -> bool
```

True whether the transition scene has a transition corresponding to name provided.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|name|`String`|Transition name to check for availability.|yes|

#### Returns

Returns true whether the transition scene has a transition corresponding to name provided. true if a transition exists with given name. (`bool`)
    
% ...
---
### reset\_shader\_cutoff

```gdscript
func reset_shader_cutoff() -> void
```

Resets the current material's cutoff parameter instantly.

#### Parameters

None. 
#### Returns

Returns nothing.
