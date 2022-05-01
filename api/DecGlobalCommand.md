<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# DecGlobalCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`dec_global name value`

Subtract the given value from the specified global.

**Parameters**

- *name*: Name of the global to be changed
- *value*: Value to be subtracted (default: 1)

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