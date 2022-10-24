<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# StopCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`stop`

Stops the current event's execution. Note that this will stop the current
script entirely - if you're within a conditional block, the code after the
conditional block will not be executed.

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