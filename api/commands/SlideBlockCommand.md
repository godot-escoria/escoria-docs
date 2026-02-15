
  (SlideBlockCommand)=
# SlideBlockCommand

**Extends:** {ref}`SlideCommand <SlideCommand>`
        
## Description

`slide_block(object: String, target: String[, speed: Integer])`

Moves `object` towards the position of `target`. This command is blocking.

- *object*: Global ID of the object to move
- *target*: Global ID of the target object
- *speed*: The speed at which to slide in pixels per second (will default to the speed configured on the `object`)

**Warning** This command does not respect the room's navigation polygons, so `object` can be moved even when outside walkable areas.  

## Methods
    
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
