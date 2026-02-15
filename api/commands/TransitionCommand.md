
  (TransitionCommand)=
# TransitionCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`transition(transition_name: String, mode: String[, delay: Number])`

Runs a transition effect - generally used when entering or leaving a room. Transitions are implemented as Godot shaders. Custom transitions can be made by creating a shader in the `game/scenes/transitions/shaders/` folder within the escoria-core plugin folder.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|transition_name|`String`|Name of the transition shader from one of the transition directories|yes|
|mode|`String`|Set to `in` to transition into or `out` to transition out of the room|yes|
|delay|`Number`|Delay in seconds before starting the transition (default: `1.0`)|no|

 

## Methods
    
% ...
---
### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

The descriptor of the arguments of this command.

#### Parameters

None. 
#### Returns

Returns the descriptor of the arguments of this command. The argument descriptor for this command. (`ESCCommandArgumentDescriptor`)
    
% ...
---
### validate

```gdscript
func validate(arguments: Array) -> Variant
```

Validates whether the given arguments match the command descriptor.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|The arguments to validate.|yes|

#### Returns

Returns True if the arguments are valid, false otherwise. (`bool`)
    
% ...
---
### run

```gdscript
func run(command_params: Array) -> int
```

Runs the command.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_params|`Array`|The parameters for the command.|yes|

#### Returns

Returns the execution result code. (`int`)
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Function called when the command is interrupted.

#### Parameters

None. 
#### Returns

Returns nothing.
