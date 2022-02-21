<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraSetPosCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`camera_set_pos speed x y`

Moves the camera to the given absolute position over a time period.

**Parameters**

- *speed*: Number of seconds the transition should take
- *x*: Target X coordinate
- "y*: Target Y coordinate

For more details see: https://docs.escoria-framework.org/en/devel/getting_started/camera.html

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