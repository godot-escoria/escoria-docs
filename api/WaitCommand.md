<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# WaitCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`wait seconds`

Blocks execution of the current event.

**Parameters**

- *seconds*: Number of seconds to block

@ESC

## Property Descriptions

### timer

```gdscript
var timer: Timer
```

Timer to wait for

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
func run(command_params: Array) -> var
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.