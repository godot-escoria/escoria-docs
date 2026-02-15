
  (CameraShiftCommand)=
# CameraShiftCommand

**Extends:** {ref}`ESCCameraBaseCommand <ESCCameraBaseCommand>`
        
## Description

`camera_shift(x: Number, y: Number[, time: Number[, type: String]])`

Shifts the camera by the given horizontal and vertical amounts relative to the current location.

**Parameters**

- *x*: Shift by x pixels along the x-axis
- *y*: Shift by y pixels along the y-axis
- *time*: Number of seconds the transition should take, with a value of `0` meaning the zoom should happen instantly (default: `1`)
- *type*: Transition type to use (default: `QUAD`)

Supported transitions include the names of the values used in the "TransitionType" enum of the "Tween" type (without the "TRANS_" prefix):

https://docs.godotengine.org/en/stable/classes/class_tween.html?highlight=tween#enumerations

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
### interrupt

```gdscript
func interrupt() -> void
```

Function called when the command is interrupted.

#### Parameters

None. 
#### Returns

Returns nothing.
