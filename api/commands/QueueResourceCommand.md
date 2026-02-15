
  (QueueResourceCommand)=
# QueueResourceCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`queue_resource(path: String[, front_of_queue: Boolean])`

Queues the loading of the given resource into the resource cache.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|path|`String`|Path of the resource to cache|yes|
|front_of_queue|`Boolean`|Whether to put the resource at the front of the queue in order to load it as soon as possible (default: `false`)|no|

 

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
func validate(arguments: Array) -> bool
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
