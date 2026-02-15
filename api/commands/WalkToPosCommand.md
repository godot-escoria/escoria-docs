
  (WalkToPosCommand)=
# WalkToPosCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`walk_to_pos(object: String, x: Integer, y: Integer[, walk_fast: Boolean])`

Moves the specified `ESCPlayer` or movable `ESCItem` to the absolute coordinates provided while playing the `object`'s walking animation. This command is non-blocking. This command will use the normal walk speed by default.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the object to move|yes|
|x|`Integer`|X-coordinate of target position|yes|
|y|`Integer`|Y-coordinate of target position|yes|
|walk_fast|`Boolean`|Whether to walk fast (`true`) or normal speed (`false`). (default: false)|no|

 

## Members
    
### walking\_object\_node

```gdscript
var walking_object_node: ESCItem
```

Walking object

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
