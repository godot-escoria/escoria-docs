
  (CustomCommand)=
# CustomCommand

**Extends:** {ref}`ESCBaseCommand <ESCBaseCommand>`
        
## Description

`custom(object: String, node: String, func_name: String[, params...])`

Executes the specified Godot function. This function must be in a script attached to a child node of a registered `ESCItem`.

#### Parameters

| Name | Type | Description | Required? |
|:-----|:-----|:------------|:----------|
|object|`String`|Global ID of the target `ESCItem`|yes|
|node|`String`|Name of the child node of the target `ESCItem`|yes|
|func_name|`String`|Name of the function to be called|yes|
|params...|`Variant`|Optional arguments passed to the target function (arrays and objects are not supported). Additional positional parameters can be listed after the required ones, e.g. `custom("the_object", "the_node", "the_function", arg1, arg2)`.|no|

 

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
