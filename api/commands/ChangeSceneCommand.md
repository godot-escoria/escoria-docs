
  (ChangeSceneCommand)=
# ChangeSceneCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`change_scene(path: String[, enable_automatic_transition: Boolean[, run_events: Boolean]])`

Switches the game from the current scene to another scene. Use this to move the player to a new room when they walk through an unlocked door, for example.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|path|`String`|Path of the new scene|yes|
|enable_automatic_transition|`Boolean`|Automatically transition to the new scene (default: `true`)|no|
|run_events|`Boolean`|Run the standard ESC events of the new scene (default: `true`)|no|

 

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
func validate(arguments: Array) -> bool
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
