<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SaveGameCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`save_game slot_id savegame_description`

Saves the game in the [slot_id] slot, and sets the [savegame_description] in
the savegame name/title.

Example:
`save_game 1 "description of game saved`

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