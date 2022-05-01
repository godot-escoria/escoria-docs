<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SetInteractiveCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`set_interactive object interactive`

Sets whether an object is interactive.

**Parameters**

- *object*: Global ID of the object to change
- *interactive*: Whether the object should be interactive

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