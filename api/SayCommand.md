<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SayCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`say player text [type]`

Displays the specified string as dialog spoken by the player. This command
blocks further event execution until the dialog has finished being 'said'
(either as displayed text or as audible speech from a file).

**Parameters**

- *player*: Global ID of the `ESCPlayer` or `ESCItem` object that is active
- *text*: Text to display
- *type*: Dialog type to use. One of `floating` or `avatar`
  (default: the value set in the setting "Escoria/UI/Default Dialog Type")

The text supports translation keys by prepending the key followed by
a colon (`:`) to the text.

Example: `say player ROOM1_PICTURE:"Picture's looking good."`

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

Validate wether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> var
```

Run the command