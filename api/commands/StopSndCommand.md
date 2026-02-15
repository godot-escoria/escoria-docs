
  (StopSndCommand)=
# StopSndCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`stop_snd([audio_bus: String])`

Stops the given audio bus's stream. By default there are 4 audio buses set up by Escoria : `_sound`, which is used to play non-looping sound effects; `_music`, which plays looping music; `_ambient`, which plays looping background sounds; and `_speech`, which plays non-looping voice files (default: `_music`). Each simultaneous sound (e.g. multiple game sound effects) will require its own bus. To create additional buses, see the Godot sound documentation : [Audio buses](https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html#doc-audio-buses)

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|audio_bus|`String`|Bus to stop ("_sound", "_music", "_speech", "_ambient", or a custom audio bus you have created.)|no|

 

## Members
    
### previous\_snd\_state

```gdscript
var previous_snd_state: String
```

The previous sound state, saved for interrupting

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
