<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# StopSndCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`stop_snd [audio_bus]`

Stops the given audio bus's stream.

By default there are 3 audio buses set up by Escoria : `_sound`, which is
used to play non-looping sound effects; `_music`, which plays looping music;
and `_speech`, which plays non-looping voice files (default: `_music`).

Each simultaneous sound (e.g. multiple game sound effects) will require its
own bus. To create additional buses, see the Godot sound documentation :
[Audio buses](https://docs.godotengine.org/en/stable/tutorials/audio/audio_buses.html#doc-audio-buses)

**Parameters**

- *audio_bus*: Bus to stop ("_sound", "_music", "_speech", or a custom
  audio bus you have created.)

@ESC

## Property Descriptions

### previous\_snd\_state

```gdscript
var previous_snd_state: String
```

The previous sound state, saved for interrupting

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

### validate

```gdscript
func validate(arguments: Array)
```

Validate whether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.