<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraSetZoomHeightCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`camera_set_zoom_height pixels [time]`

Zooms the camera in/out so it occupies the given height in pixels

**Parameters**

- *pixels*: Target height in pixels
- *time*: Number of seconds the transition should take, with a value of `0`
  meaning the zoom should happen instantly (default: `0`)

For more details see: https://docs.escoria-framework.org/camera

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