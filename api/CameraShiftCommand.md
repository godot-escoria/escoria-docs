<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraShiftCommand

**Extends:** [ESCCameraBaseCommand](../ESCCameraBaseCommand) < [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`camera_shift x y [time] [type]`

Shifts the camera by the given horizontal and vertical amounts relative to the
current location.

**Parameters**

- *x*: Shift by x pixels along the x-axis
- *y*: Shift by y pixels along the y-axis
- *time*: Number of seconds the transition should take, with a value of `0`
  meaning the zoom should happen instantly (default: `1`)
- *type*: Transition type to use (default: `QUAD`)

Supported transitions include the names of the values used
in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera

@ESC

## Constants Descriptions

### SUPPORTED\_TRANSITIONS

```gdscript
const SUPPORTED_TRANSITIONS: Array = ["LINEAR","SINE","QUINT","QUART","QUAD","EXPO","ELASTIC","CUBIC","CIRC","BOUNCE","BACK"]
```

The list of supported transitions as per the link mentioned above

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

### validate

```gdscript
func validate(arguments: Array)
```

Validate whether the given arguments match the command descriptor

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.