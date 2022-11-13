<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraSetZoomHeightBlockCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`camera_set_zoom_height_block pixels [time]`

Zooms the camera in/out so it occupies the given height in pixels.
Blocks until the command completes.

**Parameters**

- *pixels*: Target height in pixels (integer values only)
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