<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraSetZoomBlockCommand

**Extends:** [ESCCameraBaseCommand](../ESCCameraBaseCommand) < [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`camera_set_zoom_block magnitude [time]`

Zooms the camera in/out to the desired `magnitude`. Values larger than '1' zoom
the camera out while smaller values zoom in. These values are relative to the
default zoom value of '1', not the current value. As such, while using a value
of '0.5' would double the size of the graphics, running the same command again
would result in no change. The zoom will happen over the given time period.
Blocks until the command completes.

Zoom operations might not be as smooth as desired if the requested zoom
level results in an edge of the camera meeting any defined camera limits.

**Parameters**

- *magnitude*: Magnitude of zoom
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