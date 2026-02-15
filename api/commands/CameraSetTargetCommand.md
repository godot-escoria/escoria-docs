
  (CameraSetTargetCommand)=
# CameraSetTargetCommand

**Extends:** {ref}`ESCCameraBaseCommand <ESCCameraBaseCommand>`
        
## Description

`camera_set_target(time: Number, object: String)`

Configures the camera to follow the supplied Escoria object, easing into the new target over the requested duration.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|time|`Number`|Duration in seconds for the camera to transition to the target.|yes|
|object|`String`|Global ID of the object the camera should follow.|yes|

For more details see: https://docs.escoria-framework.org/camera
 

## Methods
    
% ...
---
### configure

```gdscript
func configure() -> ESCCommandArgumentDescriptor
```

Provides the argument descriptor that defines the command signature.

#### Parameters

None. 
#### Returns

Returns the descriptor used to validate command arguments. (`ESCCommandArgumentDescriptor`)
    
% ...
---
### validate

```gdscript
func validate(arguments: Array) -> Variant
```

Validates the command arguments and ensures the target object exists.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|arguments|`Array`|Command arguments to check against the descriptor.|yes|

#### Returns

Returns `true` when the arguments are valid; otherwise `false`. (`bool`)
    
% ...
---
### run

```gdscript
func run(command_params: Array) -> int
```

Applies the camera target using the provided arguments.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|command_params|`Array`|Execution parameters `[time, object_id]` for the command.|yes|

#### Returns

Returns the command execution result code. (`int`)
    
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
