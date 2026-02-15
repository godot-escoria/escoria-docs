
  (WalkCommand)=
# WalkCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`walk(object: String, target: String[, walk_fast: Boolean])`

Moves the specified `ESCPlayer` or movable `ESCItem` to the `target` ESCItem's location while playing `object`'s walking animation. This command is non-blocking. This command will use the normal walk speed by default. If the `target` `ESCItem` has a child `ESCLocation` node, the walk destination will be the position of the `ESCLocation`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the object to move|yes|
|target|`String`|Global ID of the target object|yes|
|walk_fast|`Boolean`|Whether to walk fast (`true`) or normal speed (`false`) (default: false)|no|

 

## Members
    
### walking\_object\_node

```gdscript
var walking_object_node: ESCItem
```

Walking object
    
### target\_object\_node

```gdscript
var target_object_node: ESCObject
```

Target object

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
