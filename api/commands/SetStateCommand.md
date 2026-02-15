
  (SetStateCommand)=
# SetStateCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`set_state(object: String, state: String[, immediate: Boolean])`

Changes the state of `object` to the one specified. This command is primarily used to play animations. If the specified object's associated animation player has an animation with the same name, that animation is also played. When the "state" of the object is set - for example, a door may be set to a "closed" state - this plays the matching "close" animation if one exists (to show the door closing in the game). When you re-enter the room (via a different entry), or restore a saved game, the state of the door object will be restored - showing the door as a closed door.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the object whose state is to be changed|yes|
|state|`String`|Name of the state to be set|yes|
|immediate|`Boolean`|If an animation for the state exists, specifies whether it is to skip to the last frame. Can be `true` or `false`.|no|

 

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
