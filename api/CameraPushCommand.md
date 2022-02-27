<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraPushCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`camera_push target [time] [type]`

Pushes the camera to point at a specific `target`.

**Parameters**

- *target*: Global ID of the `ESCItem` to push the camera to. If the target
  has a child node called `camera_node`, its location will be used. If not,
  the location of the target will be used
- *time*: Number of seconds the transition should take (default: `1`)
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