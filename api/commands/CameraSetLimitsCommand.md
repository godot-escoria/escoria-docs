
  (CameraSetLimitsCommand)=
# CameraSetLimitsCommand

**Extends:** {ref}`ESCCameraBaseCommand <ESCCameraBaseCommand>`
        
## Description

`camera_set_limits(camlimits_id: Integer)`

Limits the current camera's movement to a limit defined in the `ESCRoom`'s definition. A limit is defined as an upper-left (x, y) coordinate, a width and a height that the camera must stay within. Multiple limits can be defined for a room, allowing for new areas to be seen once they have been 'unlocked'.

**Parameters**

- *camlimits_id*: Index of the camera limit defined in the `camera limits` list of the current `ESCRoom`

For more details see: https://docs.escoria-framework.org/camera  

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
