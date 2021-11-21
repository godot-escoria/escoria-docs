<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SlideCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`slide object target [speed]`

Moves `object` towards the position of `target`. This command is
non-blocking.

- *object*: Global ID of the object to move
- *target*: Global ID of the target object
- *speed*: Movement speed (default: the default speed of `object`)

**Warning** This command does not respect the room's navigation polygons, so
`object` can be moved even when outside walkable areas.

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