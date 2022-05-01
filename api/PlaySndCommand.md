<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# PlaySndCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`play_snd file [player]`

Plays the specified sound without blocking the currently running event.

**Parameters**

- *file*: Sound file to play
- *player*: Sound player to use. Can either be `_sound`, which is used to play non-
  looping sound effects; `_music`, which plays looping music; or `_speech`, which
  plays non-looping voice files (default: `_sound`)

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

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.