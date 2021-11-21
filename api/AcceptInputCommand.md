<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# AcceptInputCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`accept_input [type]`

Sets how much input the game is to accept, allowing for cut scenes
in which dialog can be skipped (if [type] is set to SKIP).
Also allows for cut scenes that can be completely locked down.

**Parameters**

- *type*: Type of inputs to accept (ALL)
  `ALL`: Accept all types of input
  `SKIP`: Accept skipping dialogs but nothing else
  `NONE`: Deny all inputs (including opening menus)

**Warning**: `SKIP` and `NONE` also disable autosaves.

**Note**: If `SKIP` is specified, it will be reset to `ALL` when the event has
finished. `NONE` persists even after the event.

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
func run(command_params: Array) -> int
```

Run the command