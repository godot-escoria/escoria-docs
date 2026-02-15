
  (CameraPushCommand)=
# CameraPushCommand

**Extends:** {ref}`ESCCameraBaseCommand <ESCCameraBaseCommand>`
        
## Description

`camera_push(target: String[, time: Number[, type: String]])`

Pushes (moves) the camera so it points at a specific `target`. If the camera was following a target (like the player) previously, it will no longer follow this target.

Make sure the target is reachable if camera limits have been configured.

**Parameters**

- *target*: Global ID of the `ESCItem` to push the camera to. `ESCItem`s have a "camera_node" property that can be set to point to a node (usually an `ESCLocation` node). If the "camera_node" property is empty, `camera_push` will point the camera at the `ESCItem`s location. If however, the `ESCItem` has its "camera_node" property set, the command will instead point the camera at the node referenced by the `ESCItem`s "camera_node" property.
- *time*: Number of seconds the transition should take (default: `1`)
- *type*: Transition type to use (default: `QUAD`)

Supported transitions include the names of the values used in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

See https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

For more details see: https://docs.escoria-framework.org/camera  

## Constants

### SUPPORTED\_TRANSITIONS
```gdscript
const SUPPORTED_TRANSITIONS = ["LINEAR", "SINE", "QUINT", "QUART", "QUAD", "EXPO", "ELASTIC", "CUBIC", "CIRC", "BOUNCE", "BACK"]

```
The list of supported transitions as per the link mentioned above
## Methods
    
% ...
---
### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

The descriptor of the arguments of this command.

#### Parameters

None. 
#### Returns

Returns the descriptor of the arguments of this command. The argument descriptor for this command. (`ESCCommandArgumentDescriptor`)
    
% ...
---
### validate

```gdscript
func validate(arguments: Array) -> Variant
```

Validates whether the given arguments match the command descriptor.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|The arguments to validate.|yes|

#### Returns

Returns True if the arguments are valid, false otherwise. (`bool`)
    
% ...
---
### run

```gdscript
func run(command_params: Array) -> int
```

Runs the command.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_params|`Array`|The parameters for the command.|yes|

#### Returns

Returns the execution result code. (`int`)
    
% ...
---
### interrupt

```gdscript
func interrupt() -> void
```

Function called when the command is interrupted.

#### Parameters

None. 
#### Returns

Returns nothing.
