<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraShiftCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`camera_shift x y [time] [type]`

Shifts the camera by the given horizontal and vertical amounts.

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