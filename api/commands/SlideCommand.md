
  (SlideCommand)=
# SlideCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`slide(object: String, target: String[, speed: Integer])`

Moves `object` towards the position of `target`. This command is non-blocking.

**Warning** This command does not respect the room's navigation polygons, so `object` can be moved even when outside walkable areas!

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the object that should slide.|yes|
|target|`String`|Global ID of the object whose position is used as the destination.|yes|
|speed|`Integer`|Optional slide speed in pixels per second (defaults to the object's configured speed when negative).|no|

 

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
