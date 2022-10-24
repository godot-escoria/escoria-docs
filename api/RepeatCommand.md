<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# RepeatCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`repeat`

Makes the current script loop back to the start. Currently the only way to
exit the loop is via the `stop` command which will stop the script
completely.

@ESC

## Method Descriptions

### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Return the descriptor of the arguments of this command

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