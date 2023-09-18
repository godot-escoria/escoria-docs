<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

# CameraPushCommand

**Extends:** [ESCCameraBaseCommand](../ESCCameraBaseCommand) < [ESCBaseCommand](../ESCBaseCommand) < [Resource](../Resource)

## Description

`camera_push target [time] [type]`

Pushes (moves) the camera so it points at a specific `target`. If the camera
was following a target (like the player) previously, it will no longer follow
this target.

Make sure the target is reachable if camera limits have been configured.

**Parameters**

- *target*: Global ID of the `ESCItem` to push the camera to. `ESCItem`s have
  a "camera_node" property that can be set to point to a node (usually an
  `ESCLocation` node). If the "camera_node" property is empty, `camera_push`
  will point the camera at the `ESCItem`s location. If however, the `ESCItem`
  has its "camera_node" property set, the command will instead point the
  camera at the node referenced by the `ESCItem`s "camera_node" property.
- *time*: Number of seconds the transition should take (default: `1`)
- *type*: Transition type to use (default: `QUAD`)

Supported transitions include the names of the values used
in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

See https://docs.godotengine.org/en/3.5/classes/class_tween.html?highlight=tween#enumerations

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

Validate whether the given arguments match the command descriptor

### run

```gdscript
func run(command_params: Array) -> int
```

Run the command

### interrupt

```gdscript
func interrupt()
```

Function called when the command is interrupted.