
  (SetDirectionCommand)=
# SetDirectionCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`set_direction(object: String, direction_id: Integer[, wait: Number])`

Turns a movable `ESCItem` or `ESCPlayer` to face a given target direction id (between 0 and 3 for a 4-directional character, or between 0 and 7 for an 8-directional character). 4-directional : 0 : UP / NORTH 1 : RIGHT / EAST 2 : DOWN / SOUTH 3 : LEFT / WEST 8-directional : 0 : UP / NORTH 1 : UP-RIGHT / NORTH-EAST 2 : RIGHT / EAST 3 : DOWN-RIGHT / SOUTH-EAST 4 : DOWN / SOUTH 5 : DOWN-LEFT / SOUTH-WEST 6 : LEFT / WEST 7 : TOP-LEFT / NORTH-WEST

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the object to turn|yes|
|direction_id|`Integer`|Target direction index from the animation resource.|yes|
|wait|`Number`|Seconds to spend on each intermediate step when rotating toward the target direction (0 means immediate).|no|

 

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
