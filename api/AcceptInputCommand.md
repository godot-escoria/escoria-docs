<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# AcceptInputCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`accept_input [type]`

Sets how much input the game is to accept. This allows for cut scenes
in which dialogue can be skipped (if [type] is set to SKIP), and ones where
it can't (if [type] is set to NONE).

**Parameters**

- *type*: Type of inputs to accept (ALL)
  `ALL`: Accept all types of user input
  `SKIP`: Accept skipping dialogues but nothing else
  `NONE`: Deny all inputs (including opening menus)

**Warning**: `SKIP` and `NONE` also disable autosaves.

**Warning**: The type of user input accepted will persist even after the
current event has ended. Remember to reset the input type at the end of
cut-scenes!

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