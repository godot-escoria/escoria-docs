<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraSetLimitsCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`camera_set_limits camlimits_id`

Activates the current camera's limits

**Parameters**

- *camlimits_id*: Index of the camera limit in the `camera limits`
  list of the current `ESCRoom`

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