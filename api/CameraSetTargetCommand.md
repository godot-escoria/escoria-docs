<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraSetTargetCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`camera_set_target time object`

Configures the camera to follow the specified target `object`

**Parameters**

- *time*: Number of seconds the transition should take
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

Validate wether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command