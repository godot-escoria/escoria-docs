<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# TransitionCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`transition transition_name mode [delay]`

Performs a transition into or out of a room programmatically.

**Parameters**

- *transition_name*: Name of the transition shader from one of the transition
  directories
- *mode*: Set to `in` to transition into or `out` to transition out of the room
- *delay*: Delay in seconds before starting the transition (default: `1.0`)

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
func run(command_params: Array) -> var
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.