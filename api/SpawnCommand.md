<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SpawnCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`spawn identifier path [is_active] [position_target]`

Programmatically adds a new item to the scene.

**Parameters**

- *identifier*: Global ID to use for the new object
- *path*: Path to the scene file of the object
- *is_active*: Whether the new object should be set to active (default: `true`)
- *position_target*: Global ID of another object that will be used to
  position the new object (when omitted, the new object's position is not specified)

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