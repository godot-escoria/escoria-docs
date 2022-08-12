<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# SlideBlockCommand

**Extends:** [SlideCommand](../SlideCommand) < [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`slide_block object target [speed]`

Moves `object` towards the position of `target`. This command is
blocking.

- *object*: Global ID of the object to move
- *target*: Global ID of the target object
- *speed*: The speed at which to slide in pixels per second (will default to
  the speed configured on the `object`)

**Warning** This command does not respect the room's navigation polygons, so
`object` can be moved even when outside walkable areas.

@ESC

## Method Descriptions

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