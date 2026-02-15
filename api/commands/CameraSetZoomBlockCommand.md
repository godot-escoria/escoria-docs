
  (CameraSetZoomBlockCommand)=
# CameraSetZoomBlockCommand

**Extends:** {ref}`ESCCameraBaseCommand <ESCCameraBaseCommand>`
        
## Description

`camera_set_zoom_block(magnitude: Number[, time: Number])`

Zooms the camera in/out to the desired `magnitude`. Values larger than '1' zoom the camera out while smaller values zoom in. These values are relative to the default zoom value of '1', not the current value. As such, while using a value of '0.5' would double the size of the graphics, running the same command again would result in no change. The zoom will happen over the given time period. Blocks until the command completes.

Zoom operations might not be as smooth as desired if the requested zoom level results in an edge of the camera meeting any defined camera limits.

**Parameters**

- *magnitude*: Magnitude of zoom
- *time*: Number of seconds the transition should take, with a value of `0` meaning the zoom should happen instantly (default: `0`)

For more details see: https://docs.escoria-framework.org/camera  

## Members

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
