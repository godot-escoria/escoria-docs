<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraSetLimitsCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`camera_set_limits camlimits_id`

Limits the current camera's movement to a limit defined in the `ESCRoom`'s 
definition. A limit is defined as an upper-left (x, y) coordinate, a width
and a height that the camera must stay within. Multiple limits can be
defined for a room, allowing for new areas to be seen once they have
been 'unlocked'.

**Parameters**

- *camlimits_id*: Index of the camera limit defined in the `camera limits`
  list of the current `ESCRoom`

For more details see: https://docs.escoria-framework.org/en/devel/getting_started/camera.html

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