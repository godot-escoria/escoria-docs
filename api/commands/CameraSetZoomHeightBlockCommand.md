
  (CameraSetZoomHeightBlockCommand)=
# CameraSetZoomHeightBlockCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`camera_set_zoom_height_block(pixels: Integer[, time: Number])`

Zooms the camera in/out so it occupies the given height in pixels. Blocks until the command completes.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|pixels|`Integer`|Target height in pixels (integer values only)|yes|
|time|`Number`|Number of seconds the transition should take, with a value of `0` meaning the zoom should happen instantly (default: `0`) For more details see: https://docs.escoria-framework.org/camera|no|

 

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
