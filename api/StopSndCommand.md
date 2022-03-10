<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# StopSndCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`stop_snd [player]`

Stops the given sound player's stream.

**Parameters**

- *player*: Sound player to use. Either `_sound`, which is used to play non-
  looping sound effects; `_music`, which plays looping music; or `_speech`, which
  plays non-looping voice files (default: `_music`)

@ESC

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