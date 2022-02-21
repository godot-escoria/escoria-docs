<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraPushCommand

**Extends:** [ESCBaseCommand](../ESCBaseCommand) < [Node](../Node)

## Description

`camera_push target [time] [type]`

Pushes (moves) the camera so it points at a specific `target`. If the camera 
was following a target (like the player) previously, it will no longer follow
this target. 

**Parameters**

- *target*: Global ID of the `ESCItem` to push the camera to. If the target
  has a child node called `camera_node`, its location will be used. If not,
  the location of the target will be used
- *time*: Number of seconds the transition should take (default: `1`)
- *type*: Transition type to use (default: `QUAD`)

Supported transitions include the names of the values used
in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

See https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/en/devel/getting_started/camera.html

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