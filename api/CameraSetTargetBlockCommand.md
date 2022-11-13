<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraSetTargetBlockCommand

**Extends:** [ESCCameraBaseCommand](../ESCCameraBaseCommand) < [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`camera_set_target_block time object`

Configures the camera to follow the specified target `object` (ESCItem) as it moves
around the current room. The transition to focus on the `object` will happen
over a time period.  Blocks until the command completes.

The camera will move as close as it can if camera limits have been configured
and the `object` is at coordinates that are not reachable.

**Parameters**

- *time*: Number of seconds the transition should take to move the camera
  to follow `object`
- *object*: Global ID of the target object

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