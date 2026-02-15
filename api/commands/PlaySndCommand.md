
  (PlaySndCommand)=
# PlaySndCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`play_snd(file: String[, player: String[, start_position_seconds: Number]])`

Plays the specified sound without blocking the currently running event.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|file|`String`|Sound file to play|yes|
|player|`String`|Sound player to use. Can either be `_sound`, which is used to play non- looping sound effects; `_music`, which plays looping music; `_ambient`, which plays looping ambient sounds; or `_speech`, which plays non-looping voice files (default: `_sound`)|no|
|start_position_seconds|`Number`|The position in seconds from which to start playing the sound file (default: `0.0`)|no|

 

## Members

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
